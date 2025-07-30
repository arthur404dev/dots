# 🛠️ Development Tools Configuration

Essential command-line tools for development, system management, and productivity, featuring modern alternatives to traditional Unix tools.

## 📦 What's Included

### Git (`.config/git/`)
Version control system configuration:
- **`config`**: Global Git configuration
  - User information and credentials
  - Aliases for common operations
  - Diff and merge tool settings
  - Push and pull behavior
  - Commit signing setup

### Lazygit (`.config/lazygit/`)
Terminal UI for Git operations:
- **`config.yml`**: Interface and behavior settings
  - Custom keybindings
  - Theme configuration
  - Git command customization
  - UI layout preferences

### Ranger (`.config/ranger/`)
Console file manager with Vim-like bindings:
- **`rc.conf`**: Main configuration file
- **`scope.sh`**: File preview script
- **`colorschemes/`**: Custom color themes
- **`plugins/`**: Additional functionality plugins

### Btop (`.config/btop/`)
Modern system resource monitor:
- **`btop.conf`**: Display and behavior settings
- **`themes/`**: Custom color schemes
  - `meowrch.theme`: Custom theme matching system colors

### LSD (`.config/lsd/`)
Modern replacement for `ls` with colors and icons:
- **`config.yaml`**: Display options and behavior
- **`colors.yaml`**: Color scheme definitions
- **`icons.yaml`**: File type icon mappings

### Fastfetch (`.config/fastfetch/`)
Fast system information display:
- **`config.jsonc`**: Display modules and formatting
- **`pngs/`**: Custom ASCII art and logos
  - System information layout
  - Hardware detection settings

### Cava (`.config/cava/`)
Console-based audio visualizer:
- **`config`**: Visualization settings and appearance
- **`shaders/`**: Custom OpenGL shaders for effects
  - Audio input configuration
  - Visual effects and colors

### Fontconfig (`.config/fontconfig/`)
Font rendering and management:
- **`conf.d/`**: Font configuration files
  - Font fallback chains
  - Rendering improvements
  - Anti-aliasing settings

### Matugen (`.config/matugen/`)
Material You color generation tool:
- **`config.toml`**: Color generation settings
- **`templates/`**: Template system for theming
  - Integration with other applications
  - Color scheme generation

### Redshift (`.config/redshift/`)
Blue light filter for eye strain reduction:
- **`redshift.conf`**: Location and color temperature settings
  - Day/night transition timing
  - Color temperature ranges
  - Location-based adjustments

### Nemo (`.config/nemo/`)
File manager configuration:
- **`bookmark-metadata`**: File manager bookmarks and metadata
  - Quick access locations
  - Custom folder shortcuts
  - Navigation preferences

### PulseAudio Control (`.config/`)
Audio system configuration:
- **`pavucontrol.ini`**: PulseAudio volume control settings
  - Audio device preferences
  - Volume control behavior
  - Input/output device management

### Dolphin (`.config/`)
KDE file manager configuration:
- **`dolphinrc`**: Dolphin file manager settings
  - View preferences and layouts
  - Navigation and toolbar customization
  - File operation preferences

## 🚀 Key Features

### Git Workflow Enhancement
- **Smart Aliases**: Shortened commands for common operations
- **Better Diffs**: Enhanced diff output with syntax highlighting
- **Commit Templates**: Standardized commit message formats
- **Branch Management**: Simplified branch creation and switching
- **Merge Strategies**: Configured merge and rebase preferences

### File Management (Ranger)
- **Vim-like Navigation**: Familiar keybindings for Vim users
- **File Previews**: Built-in preview for text, images, and documents
- **Bulk Operations**: Multi-file selection and operations
- **Custom Commands**: Extensible with custom scripts
- **Integration**: Works with external tools and editors

### System Monitoring (Btop)
- **Real-time Monitoring**: CPU, memory, disk, and network usage
- **Process Management**: Kill, prioritize, and filter processes
- **GPU Support**: NVIDIA and AMD GPU monitoring
- **Custom Themes**: Personalized color schemes
- **Mouse Support**: Click-to-interact functionality

### Modern CLI Tools
- **LSD**: Enhanced `ls` with colors, icons, and tree view
- **Fastfetch**: Quick system information with customizable output
- **Cava**: Audio visualization for music and system sounds

## ⌨️ Key Bindings and Usage

### Git Aliases
```bash
# Common shortcuts
g st                    # git status
g co <branch>          # git checkout
g cm "message"         # git commit -m
g ca                   # git commit --amend
g ps                   # git push
g pl                   # git pull
g br                   # git branch
g lg                   # git log --oneline --graph

# Advanced operations
g unstage <file>       # git reset HEAD
g last                 # git log -1 HEAD
g visual               # gitk
g undo                 # git reset --soft HEAD~1
```

### Lazygit Navigation
```bash
# Panel navigation
1-5                    # Switch between panels
Tab                    # Next panel
Shift+Tab              # Previous panel

# File operations
Space                  # Stage/unstage file
a                      # Stage all files
A                      # Unstage all files
c                      # Commit
C                      # Commit with editor

# Branch operations
n                      # New branch
b                      # Checkout branch
d                      # Delete branch
r                      # Rebase
m                      # Merge

# Git operations
p                      # Push
P                      # Pull
f                      # Fetch
```

### Ranger Commands
```bash
# Navigation
h/j/k/l               # Move left/down/up/right
gg/G                  # Go to top/bottom
H/L                   # Go back/forward in history
gh                    # Go to home directory

# File operations
Space                 # Select file
v                     # Select all files in directory
yy                    # Copy files
dd                    # Cut files
pp                    # Paste files
dD                    # Delete files

# View options
zh                    # Toggle hidden files
zp                    # Toggle file preview
zf                    # Toggle filter
S                     # Open shell in current directory

# Quick actions
r                     # Open with application
E                     # Edit file
i                     # Display file info
```

### Btop Controls
```bash
# Navigation
↑/↓                   # Navigate processes
PgUp/PgDn            # Page up/down
Home/End             # First/last process

# Process management
k                     # Kill process
t                     # Terminate process
+/-                   # Increase/decrease priority
f                     # Filter processes

# View options
m                     # Toggle memory view
n                     # Toggle network view
d                     # Toggle disk view
1-4                   # Switch between views
```

## 🔧 Customization

### Git Configuration
```ini
# ~/.config/git/config
[user]
    name = Your Name
    email = your.email@example.com
    signingkey = YOUR_GPG_KEY

[core]
    editor = nvim
    pager = delta
    autocrlf = input

[alias]
    # Custom aliases
    unstage = reset HEAD --
    last = log -1 HEAD
    visual = !gitk
    pushf = push --force-with-lease
    
[delta]
    navigate = true
    light = false
    side-by-side = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

### Ranger Customization
```python
# rc.conf
# Basic settings
set column_ratios 1,3,4
set hidden_filter ^\.|\.(?:pyc|pyo|bak|swp)$|^lost\+found$|^__(py)?cache__$
set show_hidden false
set confirm_on_delete multiple
set use_preview_script true
set automatically_count_files true
set open_all_images true
set vcs_aware false
set vcs_backend_git enabled
set vcs_backend_hg disabled
set vcs_backend_bzr disabled

# Custom keybindings
map DD shell mv %s /tmp/
map <C-f> fzf_select
map <C-l> redraw_window
```

### Btop Theme Creation
```ini
# themes/custom.theme
theme[main_bg]="#1e1e2e"
theme[main_fg]="#cdd6f4"
theme[title]="#89b4fa"
theme[hi_fg]="#f38ba8"
theme[selected_bg]="#313244"
theme[selected_fg]="#cdd6f4"
theme[inactive_fg]="#6c7086"
theme[graph_text]="#f9e2af"
theme[meter_bg]="#313244"
theme[proc_misc]="#f5c2e7"
theme[cpu_box]="#89b4fa"
theme[mem_box]="#a6e3a1"
theme[net_box]="#fab387"
theme[proc_box]="#f38ba8"
```

### LSD Configuration
```yaml
# config.yaml
classic: false
blocks:
  - permission
  - user
  - group
  - size
  - date
  - name
color:
  when: auto
  theme: custom
date: relative
dereference: false
display: all
icons:
  when: auto
  theme: fancy
  separator: " "
indicators: false
layout: grid
recursion:
  enabled: false
  depth: 5
size: default
permission: rwx
sorting:
  column: name
  reverse: false
  dir-grouping: first
no-symlink: false
total-size: false
```

## 🎨 Theming Integration

### Consistent Color Schemes
All tools use coordinated color schemes that match your system theme:

```yaml
# Color palette (used across tools)
colors:
  background: "#1e1e2e"
  foreground: "#cdd6f4"
  primary: "#89b4fa"
  secondary: "#f38ba8"
  accent: "#a6e3a1"
  warning: "#f9e2af"
  error: "#f38ba8"
```

### Matugen Integration
```toml
# config.toml
[config]
reload_apps = true
set_wallpaper = false

[templates.btop]
input_path = "~/.config/matugen/templates/btop.theme"
output_path = "~/.config/btop/themes/generated.theme"

[templates.cava]
input_path = "~/.config/matugen/templates/cava.conf"
output_path = "~/.config/cava/config"
```

## 🔄 Workflow Integration

### Development Workflow
```bash
# Daily development routine
alias dev-start='cd ~/projects && ranger'
alias git-status='lazygit'
alias sys-monitor='btop'
alias file-tree='lsd --tree'

# Project navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ll='lsd -la'
alias la='lsd -A'
alias lt='lsd --tree'
```

### System Maintenance
```bash
# System monitoring aliases
alias cpu='btop --preset cpu'
alias mem='btop --preset memory'
alias net='btop --preset network'
alias disk='btop --preset disk'

# File management
alias cleanup='ranger /tmp'
alias logs='ranger /var/log'
alias configs='ranger ~/.config'
```

## 📊 Performance Monitoring

### Btop Advanced Usage
```bash
# Command line options
btop --preset cpu          # CPU-focused view
btop --preset memory       # Memory-focused view
btop --preset network      # Network-focused view
btop --preset disk         # Disk I/O focused view
btop --utf-force          # Force UTF-8 encoding
btop --low-color          # Use low color mode
```

### System Information Scripts
```bash
#!/bin/bash
# system-info.sh
echo "=== System Information ==="
fastfetch

echo -e "\n=== Resource Usage ==="
btop --preset cpu --tty_on --update 1000 --quit-after 1

echo -e "\n=== Disk Usage ==="
lsd -la --total-size ~/
```

## 🔗 Tool Integration

### Editor Integration
```bash
# Ranger with editor
export EDITOR="nvim"
export VISUAL="nvim"

# Git with editor
git config --global core.editor "nvim"
git config --global merge.tool "nvim"
```

### Shell Integration
```bash
# Fish shell abbreviations
abbr g git
abbr lg lazygit
abbr r ranger
abbr ll 'lsd -la'
abbr lt 'lsd --tree'
abbr top btop

# Zsh aliases
alias g='git'
alias lg='lazygit'
alias r='ranger'
alias ll='lsd -la'
alias lt='lsd --tree'
alias top='btop'
```

## 📝 Troubleshooting

### Common Issues

**Git authentication problems:**
```bash
# Check SSH key
ssh -T git@github.com

# Check Git credentials
git config --list | grep user

# Reset credentials
git config --global --unset credential.helper
```

**Ranger preview issues:**
```bash
# Install preview dependencies
sudo pacman -S highlight atool w3m ffmpegthumbnailer

# Check scope.sh permissions
chmod +x ~/.config/ranger/scope.sh
```

**Btop performance issues:**
```bash
# Reduce update frequency
btop --update 2000

# Disable GPU monitoring
btop --no-gpu

# Use low color mode
btop --low-color
```

### Performance Optimization
```bash
# Optimize Git for large repositories
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256

# Ranger performance
set preview_files false
set use_preview_script false
set automatically_count_files false
```

## 🔗 Related Modules

- **[Shell](../shell/README.md)**: Shell integration and aliases for tools
- **[Editor](../editor/README.md)**: Editor integration with development tools
- **[Terminal](../terminal/README.md)**: Terminal-based tool optimization
- **[Theme](../theme/README.md)**: Consistent theming across all tools