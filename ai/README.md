# 🤖 AI Tools Configuration

Configuration for AI-powered development tools and assistants, featuring OpenCode and Claude integrations for enhanced productivity.

## 📦 What's Included

### OpenCode (`.config/opencode/`)
AI-powered coding assistant configuration:
- **`opencode.json`**: Main configuration file
  - API settings and preferences
  - Code completion behavior
  - Integration settings with editors
  - Custom prompts and templates

### Claude (`.claude/`)
Claude AI assistant configuration and data:
- **`.credentials.json`**: Authentication and API credentials
- **`shell-snapshots/`**: Shell session snapshots for context
- **`statsig/`**: Usage statistics and feature flags
- **`todos/`**: AI-generated task management and tracking

## 🚀 Key Features

### OpenCode Features
- **Intelligent Code Completion**: Context-aware code suggestions
- **Code Explanation**: Natural language explanations of complex code
- **Refactoring Assistance**: Automated code improvement suggestions
- **Bug Detection**: AI-powered error identification and fixes
- **Documentation Generation**: Automatic documentation creation
- **Multi-language Support**: Support for various programming languages

### Claude Integration
- **Conversational AI**: Natural language interaction for development tasks
- **Code Review**: AI-powered code analysis and feedback
- **Problem Solving**: Step-by-step guidance for complex problems
- **Learning Assistant**: Educational support for new technologies
- **Project Planning**: AI-assisted project structure and planning

### Workflow Enhancement
- **Context Awareness**: Maintains context across development sessions
- **Task Management**: AI-generated and tracked development tasks
- **Session Persistence**: Saves and restores AI interaction history
- **Integration**: Seamless integration with editors and terminals

## 🔧 Configuration

### OpenCode Setup
```json
{
  "api": {
    "endpoint": "https://api.opencode.ai",
    "timeout": 30000,
    "retries": 3
  },
  "completion": {
    "enabled": true,
    "auto_trigger": true,
    "delay": 500,
    "max_suggestions": 5
  },
  "features": {
    "code_explanation": true,
    "refactoring": true,
    "documentation": true,
    "bug_detection": true
  },
  "editor_integration": {
    "nvim": {
      "enabled": true,
      "keybindings": {
        "complete": "<C-Space>",
        "explain": "<leader>ce",
        "refactor": "<leader>cr",
        "docs": "<leader>cd"
      }
    },
    "vscode": {
      "enabled": true,
      "auto_complete": true
    }
  },
  "languages": {
    "javascript": {
      "enabled": true,
      "framework_detection": true
    },
    "typescript": {
      "enabled": true,
      "strict_mode": true
    },
    "python": {
      "enabled": true,
      "style_guide": "pep8"
    },
    "rust": {
      "enabled": true,
      "cargo_integration": true
    },
    "go": {
      "enabled": true,
      "module_detection": true
    }
  },
  "prompts": {
    "code_review": "Please review this code for potential improvements, bugs, and best practices:",
    "explain": "Please explain what this code does in simple terms:",
    "refactor": "Please suggest refactoring improvements for this code:",
    "optimize": "Please suggest performance optimizations for this code:"
  }
}
```

### Claude Configuration
```json
{
  "preferences": {
    "model": "claude-3-sonnet",
    "temperature": 0.7,
    "max_tokens": 4096,
    "context_window": 200000
  },
  "features": {
    "code_analysis": true,
    "project_assistance": true,
    "learning_mode": true,
    "task_tracking": true
  },
  "integrations": {
    "shell": {
      "enabled": true,
      "snapshot_frequency": "session",
      "context_preservation": true
    },
    "editor": {
      "enabled": true,
      "auto_context": true
    },
    "git": {
      "enabled": true,
      "commit_assistance": true,
      "pr_review": true
    }
  },
  "privacy": {
    "data_retention": "30_days",
    "anonymize_paths": true,
    "exclude_patterns": [
      "*.env",
      "*.key",
      "*.pem",
      "*secret*",
      "*password*"
    ]
  }
}
```

## 💡 Usage Examples

### Code Completion and Assistance
```bash
# OpenCode CLI usage
opencode complete --file main.py --line 42
opencode explain --code "def fibonacci(n): return n if n <= 1 else fibonacci(n-1) + fibonacci(n-2)"
opencode refactor --file legacy_code.js
opencode docs --function calculate_metrics --language python

# Integration with editors
# In Neovim:
# <C-Space>     - Trigger completion
# <leader>ce    - Explain code under cursor
# <leader>cr    - Suggest refactoring
# <leader>cd    - Generate documentation
```

### Claude Interaction
```bash
# Claude CLI interaction
claude ask "How do I implement a binary search tree in Rust?"
claude review --file src/main.rs
claude plan --project "web scraper with rate limiting"
claude debug --error "segmentation fault in C++ vector"

# Context-aware assistance
claude context --add-file config.yaml
claude context --add-git-diff
claude ask "How can I optimize this configuration?"
```

### Development Workflow Integration
```bash
# Git integration
git commit -m "$(claude suggest-commit-message)"
claude review-pr --pr-number 123
claude generate-changelog --from v1.0.0 --to v1.1.0

# Project assistance
claude scaffold --type "react-typescript-app" --name "my-project"
claude analyze-dependencies --file package.json
claude security-audit --directory ./src
```

## 🔄 Workflow Integration

### Editor Integration

#### Neovim Setup
```lua
-- lua/plugins/ai-tools.lua
return {
  {
    "opencode-ai/opencode.nvim",
    config = function()
      require("opencode").setup({
        api_key = os.getenv("OPENCODE_API_KEY"),
        auto_complete = true,
        keymaps = {
          complete = "<C-Space>",
          explain = "<leader>ce",
          refactor = "<leader>cr",
          docs = "<leader>cd",
        },
      })
    end,
  },
  {
    "claude-ai/claude.nvim",
    config = function()
      require("claude").setup({
        model = "claude-3-sonnet",
        keymaps = {
          ask = "<leader>ca",
          review = "<leader>cv",
          context = "<leader>cc",
        },
      })
    end,
  },
}
```

#### Shell Integration
```bash
# Fish shell functions
function ai-commit
    set commit_msg (claude suggest-commit-message --context git-diff)
    git commit -m "$commit_msg"
end

function ai-explain
    if test (count $argv) -eq 0
        echo "Usage: ai-explain <command>"
        return 1
    end
    
    set cmd (string join " " $argv)
    opencode explain --command "$cmd"
end

function ai-debug
    set error_log (tail -n 20 /var/log/app.log)
    claude debug --error "$error_log" --context project
end

# Zsh functions
ai-review() {
    local files=$(git diff --name-only HEAD~1)
    for file in $files; do
        echo "Reviewing $file..."
        claude review --file "$file"
    done
}

ai-optimize() {
    local file="$1"
    if [[ -z "$file" ]]; then
        echo "Usage: ai-optimize <file>"
        return 1
    fi
    
    opencode optimize --file "$file" --output "${file}.optimized"
}
```

### Continuous Integration
```yaml
# .github/workflows/ai-review.yml
name: AI Code Review
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  ai-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup OpenCode
        run: |
          curl -sSL https://install.opencode.ai | sh
          echo "${{ secrets.OPENCODE_API_KEY }}" > ~/.opencode/api_key
      
      - name: AI Code Review
        run: |
          opencode review-pr \
            --pr-number ${{ github.event.number }} \
            --repository ${{ github.repository }} \
            --output review.md
      
      - name: Post Review Comment
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const review = fs.readFileSync('review.md', 'utf8');
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: `## 🤖 AI Code Review\n\n${review}`
            });
```

## 🔒 Security and Privacy

### Data Protection
```bash
# Sensitive data exclusion
export OPENCODE_EXCLUDE_PATTERNS="*.env,*.key,*.pem,*secret*,*password*,*.token"
export CLAUDE_ANONYMIZE_PATHS=true
export AI_DATA_RETENTION_DAYS=30

# Local processing preferences
export OPENCODE_LOCAL_MODE=true  # Process locally when possible
export CLAUDE_PRIVACY_MODE=high  # Maximum privacy settings
```

### API Key Management
```bash
# Secure API key storage
# ~/.config/opencode/api_key (600 permissions)
# ~/.claude/.credentials.json (600 permissions)

# Environment variable setup
export OPENCODE_API_KEY="$(cat ~/.config/opencode/api_key)"
export CLAUDE_API_KEY="$(jq -r '.api_key' ~/.claude/.credentials.json)"

# Key rotation script
#!/bin/bash
# rotate-ai-keys.sh
rotate_opencode_key() {
    local new_key="$1"
    echo "$new_key" > ~/.config/opencode/api_key
    chmod 600 ~/.config/opencode/api_key
    echo "OpenCode API key rotated"
}

rotate_claude_key() {
    local new_key="$1"
    jq --arg key "$new_key" '.api_key = $key' ~/.claude/.credentials.json > /tmp/credentials.json
    mv /tmp/credentials.json ~/.claude/.credentials.json
    chmod 600 ~/.claude/.credentials.json
    echo "Claude API key rotated"
}
```

## 📊 Usage Analytics and Optimization

### Performance Monitoring
```bash
# AI tool performance tracking
ai-stats() {
    echo "=== OpenCode Usage ==="
    opencode stats --period 30d
    
    echo -e "\n=== Claude Usage ==="
    claude stats --period 30d
    
    echo -e "\n=== Response Times ==="
    tail -n 100 ~/.config/opencode/logs/performance.log | \
        awk '{sum+=$3; count++} END {print "Average response time:", sum/count "ms"}'
}

# Usage optimization
ai-optimize-config() {
    # Analyze usage patterns
    local frequent_languages=$(opencode stats --languages --top 5)
    local avg_response_time=$(opencode stats --avg-response-time)
    
    # Adjust configuration based on usage
    if [[ $avg_response_time -gt 5000 ]]; then
        echo "Enabling local processing for better performance"
        opencode config set local_processing true
    fi
    
    # Enable only frequently used languages
    echo "Optimizing language support based on usage"
    opencode config set enabled_languages "$frequent_languages"
}
```

### Custom Prompts and Templates
```json
{
  "custom_prompts": {
    "code_review_security": "Review this code specifically for security vulnerabilities, focusing on input validation, authentication, and data handling:",
    "performance_analysis": "Analyze this code for performance bottlenecks and suggest optimizations:",
    "accessibility_review": "Review this frontend code for accessibility compliance and suggest improvements:",
    "test_generation": "Generate comprehensive unit tests for this function, including edge cases:",
    "api_documentation": "Generate API documentation for this endpoint, including request/response examples:"
  },
  "templates": {
    "bug_report": {
      "sections": ["Description", "Steps to Reproduce", "Expected Behavior", "Actual Behavior", "Environment"],
      "ai_assistance": true
    },
    "feature_request": {
      "sections": ["Problem Statement", "Proposed Solution", "Alternatives", "Implementation Plan"],
      "ai_assistance": true
    }
  }
}
```

## 🔗 Related Modules

- **[Editor](../editor/README.md)**: Editor integration with AI tools
- **[Shell](../shell/README.md)**: Shell functions and AI command integration
- **[Tools](../tools/README.md)**: Development tools enhanced with AI capabilities
- **[Terminal](../terminal/README.md)**: Terminal-based AI tool usage and optimization