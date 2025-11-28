# Unified Protocol – MCP / Multi-Platform

## 1. Source of Truth

The GitHub repository and synced local folder are the authoritative state for:
- Voice protocols
- Command definitions  
- Analysis frameworks
- Integration patterns across tools

**Repository**: DDayFinSci/llm-operating-manual  
**Local**: C:\Users\Darrell\LifeOS\00_System\LLM_Operating_Manual

## 2. Session Boot Protocol

1. Read `sync_metadata.json`
2. Confirm current version and hash
3. Load context files listed in `platform_profile_[platform].json`
4. Apply DDAY_Voice_v3.3 as default behavior unless explicitly superseded

## 3. Command Interpretation

- Commands always start user messages: `/dday`, `/analyze`, `/mso`, `/voice`, `/sync`
- Multiple commands processed left to right
- Most recent command wins on conflicts
- Platform-specific prefixes: `/` for ChatGPT, `!` for Perplexity

## 4. Evolution and Updates

When new behavior is agreed upon:
1. Output complete updated MD/JSON file
2. Write to appropriate location
3. Commit to repo via 5-minute sync
4. Update sync_metadata.json hash

**No protocol changes are "real" until in the repo**

## 5. Cross-Platform Consistency

| Platform | Sync Method | Update Frequency | Limits |
|----------|------------|------------------|---------|
| GitHub | Automatic | 5 minutes | None |
| ChatGPT | Session bootstrap | Each session | None (via loader) |
| Perplexity | Manual paste | As needed | 1,500 chars |
| Claude | Projects/Memory | Automatic | Context-based |

## 6. Hash Verification

All files tracked with SHA256 hashes (truncated to 16 chars) to ensure:
- Change detection
- Version consistency
- Sync verification
- No unintended regression