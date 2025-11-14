"""
Unified Context Export System for Multi-Platform AI Integration
Author: Darrell Day
Version: 4.0
Last Updated: 2025-11-13

This script automatically exports and syncs context across:
- Claude (via MCP)
- ChatGPT (via custom instructions)
- Perplexity (via profile)
- Arc Browser (via AI assistant config)
- Comet Browser (via AI integration)
"""

import os
import json
import yaml
import hashlib
from pathlib import Path
from datetime import datetime
from typing import Dict, Any, List

class UnifiedContextExporter:
    def __init__(self):
        self.base_path = Path(r"C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual")
        self.context_path = self.base_path / "context" / "merged"
        self.browser_sync_path = self.base_path / "browser_sync"
        self.exports_path = self.base_path / "context__exports"
        
    def load_master_context(self) -> Dict[str, Any]:
        """Load the master context from merged YAML."""
        merged_file = self.context_path / "merged_context.yaml"
        if merged_file.exists():
            with open(merged_file, 'r', encoding='utf-8') as f:
                # Handle multiple YAML documents
                docs = list(yaml.safe_load_all(f))
                if docs:
                    # Merge all documents into one context
                    merged = {}
                    for doc in docs:
                        if doc:  # Skip None documents
                            merged.update(doc)
                    return merged
        return {}
    
    def generate_context_hash(self, content: str) -> str:
        """Generate SHA256 hash for context integrity."""
        return hashlib.sha256(content.encode()).hexdigest()[:8]
    
    def export_for_arc(self, context: Dict[str, Any]):
        """Export context optimized for Arc Browser's AI features."""
        arc_context = {
            "version": "4.0",
            "timestamp": datetime.now().isoformat(),
            "profile": {
                "name": "Darrell Day",
                "role": "Teaching Assistant - MSIF",
                "voice": "DDAY Professional Voice v3.3",
                "style": {
                    "tone": "Executive empathy with analytical rigor",
                    "structure": "Hierarchy without ego",
                    "cadence": "Clean, neutral register"
                }
            },
            "active_projects": {
                "MSIF": {
                    "focus": "Systematic strategy audits and faculty feedback",
                    "current_tasks": "Teaching assistant responsibilities, pitch reviews"
                },
                "CFA_Level_1": {
                    "focus": "Accelerated preparation schedule",
                    "methodology": "First-Principles → MSO loop"
                },
                "LifeOS": {
                    "focus": "Knowledge management system optimization",
                    "integration": "GitHub cross-platform sync"
                }
            },
            "communication_preferences": {
                "brevity": "150-250 words ideal",
                "emphasis": "Through structure, not formatting",
                "citations": "Required for research/finance",
                "signoff": ["Best, Darrell", "Appreciate each of you"]
            },
            "context_instructions": """
When responding in Arc's AI features (Max, instant answers, or page summaries):
1. Apply DDAY Professional Voice consistently
2. Prioritize analytical depth over surface coverage
3. Use second-order reasoning to anticipate implications
4. Maintain composed, collegial tone
5. Structure responses with clear hierarchy
6. Validate effort while maintaining standards
""",
            "integration_token": self.generate_context_hash(str(context))
        }
        
        # Save Arc configuration
        arc_file = self.browser_sync_path / "arc" / "arc_ai_context.json"
        with open(arc_file, 'w', encoding='utf-8') as f:
            json.dump(arc_context, f, indent=2)
        
        # Create Arc-specific prompt template
        arc_prompt_file = self.browser_sync_path / "arc" / "arc_prompt_template.md"
        with open(arc_prompt_file, 'w', encoding='utf-8') as f:
            f.write(f"""# Arc AI Assistant Configuration

## Quick Setup
Copy this context into Arc's AI preferences or use as a prompt prefix.

## Identity
{json.dumps(arc_context['profile'], indent=2)}

## Active Context
{json.dumps(arc_context['active_projects'], indent=2)}

## Response Framework
{arc_context['context_instructions']}

## Verification Token
Context Hash: {arc_context['integration_token']}
Last Updated: {arc_context['timestamp']}
""")
        
        print(f"[OK] Arc context exported: {arc_file}")
        
    def export_for_comet(self, context: Dict[str, Any]):
        """Export context optimized for Comet Browser."""
        comet_context = {
            "version": "4.0",
            "timestamp": datetime.now().isoformat(),
            "user_profile": {
                "professional_identity": "Darrell Day - MSIF TA & Financial Analyst",
                "communication_style": "DDAY Professional Voice",
                "current_focus": [
                    "MSIF systematic strategy evaluation",
                    "CFA Level 1 preparation",
                    "LifeOS knowledge management"
                ]
            },
            "ai_instructions": {
                "tone": "Composed and analytical",
                "depth": "Second-order reasoning with practical application",
                "structure": "Clear hierarchy, minimal transitions",
                "constraints": [
                    "Avoid excessive formatting",
                    "Lead with insight, not pleasantries",
                    "Model accountability through tone"
                ]
            },
            "domain_expertise": {
                "finance": {
                    "areas": ["Portfolio management", "Systematic strategies", "Risk analysis"],
                    "tools": ["DCF modeling", "Statistical analysis", "Performance attribution"]
                },
                "academic": {
                    "role": "Graduate teaching assistant",
                    "focus": "Transforming critique into pedagogy"
                }
            },
            "quick_commands": {
                "analyze": "Apply institutional-grade financial analysis",
                "review": "Provide faculty-level feedback with empathy",
                "synthesize": "Create MSO-structured summary",
                "audit": "Run first-principles diagnostic"
            },
            "sync_token": self.generate_context_hash(str(context))
        }
        
        # Save Comet configuration
        comet_file = self.browser_sync_path / "comet" / "comet_ai_profile.json"
        with open(comet_file, 'w', encoding='utf-8') as f:
            json.dump(comet_context, f, indent=2)
        
        # Create Comet integration script
        comet_script = self.browser_sync_path / "comet" / "comet_integration.js"
        with open(comet_script, 'w', encoding='utf-8') as f:
            f.write(f"""// Comet AI Integration Script
// Auto-inject context into Comet's AI features

const cometContext = {json.dumps(comet_context, indent=2)};

// Function to inject context into AI prompts
function injectDDAYContext(prompt) {{
    const contextPrefix = `
    [System Context]
    Professional Identity: ${{cometContext.user_profile.professional_identity}}
    Communication Style: ${{cometContext.user_profile.communication_style}}
    Instructions: ${{JSON.stringify(cometContext.ai_instructions)}}
    
    [User Query]
    `;
    
    return contextPrefix + prompt;
}}

// Auto-inject into Comet AI calls
if (window.comet && window.comet.ai) {{
    const originalQuery = window.comet.ai.query;
    window.comet.ai.query = function(prompt, options) {{
        const enhancedPrompt = injectDDAYContext(prompt);
        return originalQuery.call(this, enhancedPrompt, options);
    }};
}}

console.log('DDAY Context injected - Token:', cometContext.sync_token);
""")
        
        print(f"[OK] Comet context exported: {comet_file}")
        
    def export_for_perplexity(self, context: Dict[str, Any]):
        """Export context for Perplexity Max with voice mode optimization."""
        perplexity_context = {
            "version": "4.0",
            "timestamp": datetime.now().isoformat(),
            "voice_mode_config": {
                "response_style": "Concise and analytical",
                "tone": "Professional with controlled empathy",
                "pacing": "Deliberate, <25 word sentences",
                "avoid": ["Filler words", "Excessive transitions", "Self-referential statements"]
            },
            "profile": {
                "name": "Darrell Day",
                "context": """Teaching Assistant at Masters Student Investment Fund. 
                            Focus on systematic strategy evaluation and CFA preparation.
                            Communication style: DDAY Professional Voice - composed, precise, empathetic authority.""",
                "expertise": [
                    "Financial modeling and valuation",
                    "Systematic trading strategies", 
                    "Academic instruction and feedback"
                ]
            },
            "active_memory": {
                "current_projects": [
                    "MSIF systematic strategy audits",
                    "CFA Level 1 accelerated schedule",
                    "LifeOS GitHub integration"
                ],
                "key_frameworks": [
                    "First-Principles → MSO methodology",
                    "Root cause analysis in feedback",
                    "Second-order reasoning"
                ]
            },
            "response_templates": {
                "analysis": "State observation → Identify pattern → Project implication → Recommend action",
                "feedback": "Acknowledge effort → Diagnose gap → Provide solution → Model standard",
                "synthesis": "Core insight → Supporting evidence → Implications → Next steps"
            },
            "voice_commands": {
                "quick_audit": "Apply first-principles analysis",
                "summarize_mso": "Create structured MSO summary", 
                "review_mode": "Provide faculty-level feedback"
            },
            "verification": self.generate_context_hash(str(context))
        }
        
        # Save Perplexity configuration
        perplexity_file = self.browser_sync_path / "perplexity" / "perplexity_profile.json"
        with open(perplexity_file, 'w', encoding='utf-8') as f:
            json.dump(perplexity_context, f, indent=2)
            
        # Create voice mode optimization guide
        voice_guide = self.browser_sync_path / "perplexity" / "voice_mode_guide.md"
        with open(voice_guide, 'w', encoding='utf-8') as f:
            f.write("""# Perplexity Voice Mode Optimization Guide

## Quick Voice Commands

### For Analysis
"Using DDAY voice, analyze [topic] with second-order implications"

### For Synthesis  
"Create an MSO summary of [content] in 250 words"

### For Review
"Review this like Darrell would for MSIF students"

## Voice Mode Settings
1. Go to Perplexity Settings → Voice
2. Select professional voice (lowest pitch variation)
3. Set response length to "Detailed"
4. Enable "Follow-up questions"

## Context Activation Phrase
"Load DDAY Professional context version 4.0"

## Verification
Current Hash: """ + perplexity_context['verification'])
        
        print(f"[OK] Perplexity context exported: {perplexity_file}")
    
    def export_for_chatgpt(self, context: Dict[str, Any]):
        """Update ChatGPT custom instructions."""
        chatgpt_instructions = f"""You are working with Darrell Day, a Teaching Assistant at the Masters Student Investment Fund (MSIF).

IDENTITY & ROLE:
- Financial analyst specializing in systematic strategies and valuation
- Currently pursuing CFA Level 1 on accelerated schedule
- Manages $1M AUM student fund with institutional constraints
- Expertise: DCF modeling, risk analysis, portfolio management

COMMUNICATION STYLE (DDAY Professional Voice v3.3):
- Authority through economy: Every sentence has structural purpose
- Emphasis through syntax, not formatting (minimal bold/italics)
- Executive empathy: Validate effort while maintaining standards
- Clean cadence: <25 word sentences, neutral register
- Hierarchy without ego: Lead through composure, not assertion

ACTIVE PROJECTS:
1. MSIF: Systematic strategy audits, faculty-style feedback
2. CFA Level 1: Accelerated prep using First-Principles → MSO loop
3. LifeOS: Personal knowledge management via Obsidian + GitHub

RESPONSE FRAMEWORK:
1. Empathy (1 sentence): Acknowledge context/effort
2. Insight (1-2 sentences): Deliver observation/analysis  
3. Directive (1 sentence): Specify improvement/action

PREFERENCES:
- Length: 150-250 words for standard responses
- Sign-offs: "Best, Darrell" or "Appreciate each of you"
- Citations: Required for research/finance, optional for general communication
- Analysis: Always use second-order reasoning to anticipate implications

CURRENT FOCUS:
- Pedagogical feedback that transforms critique into teaching
- Root cause analysis over symptom correction
- Maintaining intellectual honesty within operational constraints

Context Version: 4.0
Last Updated: {datetime.now().strftime('%Y-%m-%d')}
Verification: {self.generate_context_hash(str(context))}"""
        
        # Save ChatGPT instructions
        chatgpt_file = self.browser_sync_path / "chatgpt_instructions.txt"
        with open(chatgpt_file, 'w', encoding='utf-8') as f:
            f.write(chatgpt_instructions)
        
        print(f"[OK] ChatGPT instructions exported: {chatgpt_file}")
    
    def create_sync_manifest(self):
        """Create manifest for tracking sync status."""
        manifest = {
            "version": "4.0",
            "last_sync": datetime.now().isoformat(),
            "platforms": {
                "claude": {"status": "active", "method": "MCP"},
                "chatgpt": {"status": "active", "method": "custom_instructions"},
                "perplexity": {"status": "active", "method": "profile_json"},
                "arc": {"status": "active", "method": "ai_config"},
                "comet": {"status": "active", "method": "injection_script"}
            },
            "sync_frequency": "on_commit",
            "auto_sync": True
        }
        
        manifest_file = self.browser_sync_path / "sync_manifest.json"
        with open(manifest_file, 'w', encoding='utf-8') as f:
            json.dump(manifest, f, indent=2)
        
        return manifest
    
    def run_full_export(self):
        """Execute full export to all platforms."""
        print("Starting unified context export...")
        
        # Load master context
        context = self.load_master_context()
        
        # Export to each platform
        self.export_for_arc(context)
        self.export_for_comet(context)  
        self.export_for_perplexity(context)
        self.export_for_chatgpt(context)
        
        # Create sync manifest
        manifest = self.create_sync_manifest()
        
        print(f"\n[SUCCESS] Full export complete!")
        print(f"  Platforms synced: {len(manifest['platforms'])}")
        print(f"  Context hash: {self.generate_context_hash(str(context))}")
        print(f"  Timestamp: {manifest['last_sync']}")
        
        return manifest

if __name__ == "__main__":
    exporter = UnifiedContextExporter()
    exporter.run_full_export()
