# 🐚 Shell Configuration

Modern shell configurations with custom prompts and productivity enhancements for Fish, Zsh, Bash, and cross-shell tools.

## 📦 What's Included

### Bash (`.bashrc`)
Traditional shell with sensible defaults:
- Interactive shell optimizations
- Custom aliases for common operations
- History configuration with better search
- Environment variable setup
- Prompt customization

### Zsh (`.zshrc`)
Powerful shell with advanced features:
- Plugin system integration
- Advanced completion system
- Custom key bindings and shortcuts
- History sharing between sessions
- Directory navigation improvements

### Fish Shell (`.config/fish/`)
Modern shell with intelligent features:
- **`config.fish`**: Main configuration file with custom functions
- **`fish_variables`**: Shell variables and settings
- **`completions/`**: Custom command completions
- **`auto-Hypr.fish`**: Hyprland integration script

### Starship Prompt (`.config/starship.toml`)
Cross-shell prompt with rich information:
- Git status indicators with branch and changes
- Language version displays (Node, Python, Rust, etc.)
- Directory path with smart truncation
- Command execution time
- Custom icons and formatting
- Performance optimized

### Zsh Configurations (`.config/zshrc.d/`)
Modular Zsh configuration system:
- **`auto-Hypr.sh`**: Hyprland window manager auto-start
- **`dots-hyprland.zsh`**: Hyprland-specific environment setup
- **`shortcuts.zsh`**: Custom keyboard shortcuts and aliases

## 🚀 Key Features

### Universal Aliases
```bash
# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'

# System shortcuts
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
```

### Environment Variables
```bash
# Editor preferences
export EDITOR='nvim'
export VISUAL='nvim'

# Browser setup
export BROWSER='firefox'

# Development tools
export PAGER='less'
export LESS='-R'

# Custom PATH additions
export PATH="$HOME/.local/bin:$PATH"
```

### Fish Shell Features
- **Intelligent autosuggestions**: Based on history and completions
- **Syntax highlighting**: Real-time command validation
- **Web-based configuration**: `fish_config` command
- **Universal variables**: Shared across all sessions

### Starship Prompt Modules
- **Directory**: Current path with Git repository detection
- **Git Branch**: Current branch with status indicators
- **Git Status**: Staged, modified, and untracked file counts
- **Language Versions**: Node.js, Python, Rust, Go versions when relevant
- **Command Duration**: Execution time for long-running commands
- **Character**: Changes color based on last command success

## ⌨️ Key Bindings

### Zsh Shortcuts
```bash
# History navigation
Ctrl+R          # Reverse history search
Ctrl+P          # Previous command
Ctrl+N          # Next command

# Line editing
Ctrl+A          # Beginning of line
Ctrl+E          # End of line
Ctrl+W          # Delete word backward
Alt+D           # Delete word forward

# Directory navigation
Alt+Left        # cd to previous directory
Alt+Right       # cd to next directory
```

### Fish Shell Shortcuts
```bash
# Autosuggestions
Tab             # Accept suggestion
Ctrl+F          # Accept one word
Alt+F           # Accept one word

# History
Up/Down         # History search
Ctrl+R          # History pager
```

## 🔧 Customization

### Adding New Aliases
**For Bash/Zsh:**
```bash
# Edit .bashrc or .zshrc
echo "alias myalias='my command'" >> ~/.bashrc
source ~/.bashrc
```

**For Fish:**
```fish
# Create an abbreviation (recommended)
abbr myalias 'my command'

# Or create a function
function myalias
    my command $argv
end
funcsave myalias
```

### Modifying Starship Prompt
Edit `.config/starship.toml`:
```toml
# Customize the prompt format
format = """
$directory\
$git_branch\
$git_status\
$nodejs\
$python\
$character"""

# Customize individual modules
[directory]
truncation_length = 3
truncate_to_repo = false

[git_branch]
symbol = "🌱 "
format = "[$symbol$branch]($style) "

[character]
success_symbol = "[➜](bold green)"
error_symbol = "[➜](bold red)"
```

### Environment Customization
Create shell-specific configurations:
```bash
# For development tools
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# For language managers
export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
```

## 🎨 Theming

### Color Schemes
All shells inherit colors from your terminal emulator, but you can customize:

**Bash/Zsh:**
```bash
# Custom PS1 colors
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

**Fish:**
```fish
# Set custom colors
set fish_color_command blue
set fish_color_param cyan
set fish_color_error red
```

### Starship Themes
```toml
# Use a preset theme
format = "$all$character"

# Or customize colors
[directory]
style = "bold cyan"

[git_branch]
style = "bold purple"
```

## 🔄 Shell Switching

### Changing Default Shell
```bash
# List available shells
cat /etc/shells

# Change to fish
chsh -s /usr/bin/fish

# Change to zsh
chsh -s /usr/bin/zsh

# Change to bash
chsh -s /bin/bash
```

### Temporary Shell Switch
```bash
# Start fish from any shell
fish

# Start zsh from any shell
zsh

# Return to previous shell
exit
```

## 📝 Notes

### Shell Compatibility
- **Aliases**: Work in bash and zsh, use abbreviations in fish
- **Functions**: Syntax differs between shells
- **Variables**: Fish uses different syntax (`set` vs `export`)
- **Starship**: Works consistently across all shells

### Performance Tips
- Fish shell has the fastest startup time
- Zsh with plugins can be slower but more feature-rich
- Starship adds minimal overhead to prompt rendering
- Use `time $SHELL -i -c exit` to benchmark shell startup

### Troubleshooting
```bash
# Check shell configuration
echo $SHELL
echo $0

# Reload configuration
source ~/.bashrc    # Bash
source ~/.zshrc     # Zsh
exec fish          # Fish (restart)

# Check starship configuration
starship config
starship explain
```

## 🔗 Related Modules

- **[Terminal](../terminal/README.md)**: Terminal emulator configurations
- **[Tools](../tools/README.md)**: CLI tools that integrate with shell
- **[Editor](../editor/README.md)**: Editor configurations for shell integration