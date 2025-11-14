# LLM Operating Manual - MCP Cross-Device Context System

[![Browser Sync](https://github.com/DDayFinSci/llm-operating-manual/actions/workflows/browser_sync.yml/badge.svg)](https://github.com/DDayFinSci/llm-operating-manual/actions/workflows/browser_sync.yml)
[![Deploy Mobile](https://github.com/DDayFinSci/llm-operating-manual/actions/workflows/deploy_mobile.yml/badge.svg)](https://github.com/DDayFinSci/llm-operating-manual/actions/workflows/deploy_mobile.yml)

## Overview

A comprehensive Model Context Protocol (MCP) ecosystem enabling persistent context synchronization across Claude, ChatGPT, Perplexity, Arc Browser, and Comet Browser. Optimized for voice mode interactions and cross-device accessibility.

## Features

- 🔄 **Automated Synchronization**: 6-hour auto-sync across all platforms
- 🎙️ **Voice Mode Optimization**: Structured for Perplexity Max voice interactions
- 🌐 **Cross-Browser Support**: Arc and Comet browsers with unified context
- ☁️ **Cloud Backup**: GitHub Actions for continuous deployment
- 📱 **Mobile Ready**: API endpoints for cross-device access
- 🔒 **Checkpoint System**: Automatic backups with rollback capability

## Quick Start

### 1. Clone Repository
```bash
git clone https://github.com/DDayFinSci/llm-operating-manual.git
cd llm-operating-manual
```

### 2. Run Setup
```powershell
# Windows PowerShell
.\scripts\github_setup.ps1
.\scripts\setup_auto_sync.ps1
```

### 3. Import Browser Configurations

#### Arc Browser
1. Open Arc → Settings → Max/AI
2. Copy content from `browser_sync/arc/arc_ai_context.json`
3. Test with `/sync` command

#### Comet Browser
1. Open Comet → AI Settings (Alt+A)
2. Copy content from `browser_sync/comet/comet_ai_context.json`
3. Test with `!sync` command

## Universal Commands

| Command | Function | Platforms |
|---------|----------|-----------|
| `/dday` or `!dday` | Apply DDAY Professional Voice | All |
| `/analyze` or `!analyze` | Second-order analysis | All |
| `/mso` or `!mso` | MSO-structured summary | All |
| `/voice` or `!voice` | Optimize for voice mode | All |
| `/sync` or `!sync` | Check sync status | All |

## Project Structure

```
llm-operating-manual/
├── browser_sync/          # Browser configurations
│   ├── arc/              # Arc browser AI context
│   ├── comet/            # Comet browser setup
│   ├── perplexity/       # Voice mode optimization
│   └── shared/           # Unified context
├── context/              # Core context files
│   ├── raw/              # Source documents
│   └── merged/           # Processed contexts
├── scripts/              # Automation scripts
│   ├── browser_sync.ps1  # Main sync script
│   ├── github_setup.ps1  # GitHub configuration
│   └── verify_integration.ps1  # System check
├── api/                  # Mobile API endpoints
│   └── context.js        # Context delivery API
└── .github/workflows/    # GitHub Actions
    ├── browser_sync.yml  # Auto-sync workflow
    └── deploy_mobile.yml # Mobile deployment
```

## Voice Mode Optimization

### Response Tiers

- **Quick (30s)**: Single insight + action
- **Standard (60s)**: Context + 2-3 points + conclusion
- **Detailed (120s)**: Framework + analysis + implications

### Verbal Markers

- **Transitions**: "First," "Second," "The key point"
- **Emphasis**: "Note that," "Critical here is"
- **Conclusions**: "Bottom line," "Net result"

## API Access

### Endpoint
```
GET /api/context?platform={arc|comet|perplexity|unified}
```

### Response
```json
{
  "context": {...},
  "metadata": {
    "platform": "arc",
    "version": "5.0",
    "timestamp": "2025-01-13T00:00:00",
    "hash": "a1b2c3d4e5f6g7h8"
  }
}
```

## Manual Sync

```powershell
# Force synchronization
.\scripts\browser_sync.ps1 -Force -Verbose

# Verify system
.\scripts\verify_integration.ps1
```

## GitHub Actions

### Browser Sync (Every 6 hours)
- Updates unified context
- Synchronizes browser configurations
- Calculates integrity hashes
- Commits changes automatically

### Mobile Deploy (On push)
- Deploys to Vercel
- Updates API endpoints
- Enables cross-device access

## Security

- `.gitignore` configured for sensitive data
- Checkpoint system for rollback
- Token management via environment variables
- Automated security updates

## Development

### Local Testing
```bash
npm run sync      # Run browser sync
npm run verify    # Check integration
npm run dev       # Start local API server
```

### Deployment
```bash
npm run deploy    # Deploy to Vercel
```

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/improvement`)
3. Commit changes (`git commit -m 'Add feature'`)
4. Push to branch (`git push origin feature/improvement`)
5. Open Pull Request

## License

MIT License - See LICENSE file for details

## Author

**Darrell Day**  
Teaching Assistant - MSIF  
DDAY Professional Voice v3.3

---

*Automated sync enabled | Voice mode optimized | Cross-device ready*