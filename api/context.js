// Mobile Context API Endpoint
// Provides cross-device access to unified context

export default async function handler(req, res) {
  // Enable CORS for mobile access
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  
  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }
  
  // Simple auth check (expand for production)
  const authToken = req.headers.authorization?.replace('Bearer ', '');
  const validTokens = process.env.VALID_TOKENS?.split(',') || [];
  
  if (authToken && !validTokens.includes(authToken)) {
    return res.status(401).json({ error: 'Invalid authorization token' });
  }
  
  try {
    const { platform, command } = req.query;
    
    // Get appropriate context based on platform
    const contexts = {
      arc: require('../browser_sync/arc/arc_ai_context.json'),
      comet: require('../browser_sync/comet/comet_ai_context.json'),
      perplexity: require('../browser_sync/perplexity/perplexity_voice_context.json'),
      unified: await getUnifiedContext()
    };
    
    // Handle commands
    if (command === 'sync') {
      return res.status(200).json({
        status: 'synchronized',
        hash: contexts.unified.hash,
        timestamp: new Date().toISOString(),
        platforms: Object.keys(contexts).filter(k => k !== 'unified')
      });
    }
    
    // Return requested context
    const requestedContext = platform ? contexts[platform] : contexts.unified;
    
    if (!requestedContext) {
      return res.status(404).json({ error: 'Context not found' });
    }
    
    res.status(200).json({
      context: requestedContext,
      metadata: {
        platform: platform || 'unified',
        version: requestedContext.version || '2.0',
        timestamp: requestedContext.timestamp || new Date().toISOString(),
        hash: requestedContext.sync_hash || requestedContext.sync_metadata?.hash
      }
    });
    
  } catch (error) {
    console.error('API Error:', error);
    res.status(500).json({ 
      error: 'Internal server error',
      message: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
}

async function getUnifiedContext() {
  const fs = require('fs').promises;
  const path = require('path');
  
  try {
    const unifiedPath = path.join(process.cwd(), 'browser_sync/shared/unified_context.md');
    const content = await fs.readFile(unifiedPath, 'utf8');
    
    // Extract hash from content
    const hashMatch = content.match(/Hash:\s*([a-f0-9]{16})/);
    const hash = hashMatch ? hashMatch[1] : 'unknown';
    
    return {
      content,
      hash,
      format: 'markdown',
      source: 'unified_context.md'
    };
  } catch (error) {
    // Fallback to basic context
    return {
      content: 'DDAY Professional Voice v3.3',
      hash: 'fallback',
      format: 'text',
      source: 'fallback'
    };
  }
}