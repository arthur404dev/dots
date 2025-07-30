# 💻 Terminal Emulator Configurations

Modern terminal emulator setups optimized for development workflows, featuring GPU acceleration, multiplexing, and consistent theming.

## 📦 What's Included

### Kitty (`.config/kitty/`)
GPU-accelerated terminal with extensive features:
- **`kitty.conf`**: Main configuration file
  - Font settings with ligature support (FiraCode, JetBrains Mono)
  - Color scheme integration with system theme
  - Window management and layout options
  - Performance optimizations
- **`scroll_mark.py`**: Custom scrollback search functionality
- **`search.py`**: Enhanced text search with regex support

### Foot (`.config/foot/`)
Lightweight Wayland-native terminal:
- **`foot.ini`**: Minimal, fast configuration
  - Optimized for Wayland compositors
  - Low memory footprint
  - Fast startup times
  - Simple but effective feature set

### Zellij (`.config/zellij/`)
Modern terminal multiplexer with intuitive UI:
- **`config.kdl`**: Main configuration in KDL format
- **`layouts/`**: Predefined workspace layouts
  - `default.kdl`: Standard development layout
- **`plugins/`**: WebAssembly plugins for extended functionality
  - `zjframes.wasm`: Window frame management
- **`themes/`**: Color schemes
  - `term.kdl`: Custom terminal theme

### Tmux (`.config/tmux/`)
Traditional but powerful terminal multiplexer:
- **`tmux.conf`**: Main configuration with modern defaults
- **`tmux_layered.conf`**: Layered configuration approach
- **`tmux_sesh.conf`**: Session management utilities
- **`plugins/`**: TPM (Tmux Plugin Manager) plugins
  - Status bar enhancements
  - Session management tools
  - Vim-like navigation

### Konsole (`.config/`)
KDE's terminal emulator configuration:
- **`konsolerc`**: Konsole terminal settings
  - Profile management
  - Appearance and behavior
  - Integration with KDE desktop

## 🚀 Key Features

### Kitty Features
- **GPU Acceleration**: Smooth scrolling and rendering
- **Ligature Support**: Programming font ligatures for better code readability
- **Image Support**: Display images directly in terminal
- **Hyperlink Support**: Clickable URLs and file paths
- **Tabs and Windows**: Built-in multiplexing capabilities
- **Keyboard Shortcuts**: Extensive customizable shortcuts

### Zellij Features
- **Modern UI**: Floating panes and intuitive layouts
- **Session Management**: Built-in session persistence
- **Plugin System**: WebAssembly-based extensibility
- **Smart Layouts**: Automatic pane arrangement
- **Copy Mode**: Vim-like text selection and copying

### Foot Features
- **Wayland Native**: Optimized for Wayland compositors
- **Minimal Resource Usage**: Low CPU and memory footprint
- **Fast Startup**: Near-instantaneous launch times
- **Server Mode**: Daemon mode for even faster startup

### Tmux Features
- **Session Persistence**: Survive system reboots
- **Window Management**: Multiple windows per session
- **Pane Splitting**: Horizontal and vertical splits
- **Plugin Ecosystem**: Extensive plugin library
- **Scriptable**: Automation and custom workflows

## ⌨️ Key Bindings

### Kitty Shortcuts
```bash
# Window management
Ctrl+Shift+Enter    # New window
Ctrl+Shift+W        # Close window
Ctrl+Shift+]        # Next window
Ctrl+Shift+[        # Previous window

# Tab management
Ctrl+Shift+T        # New tab
Ctrl+Shift+Q        # Close tab
Ctrl+Shift+Right    # Next tab
Ctrl+Shift+Left     # Previous tab

# Pane management
Ctrl+Shift+Enter    # New window
F5                  # Reload config
F6                  # Debug config

# Text operations
Ctrl+Shift+C        # Copy
Ctrl+Shift+V        # Paste
Ctrl+Shift+F        # Search scrollback
```

### Zellij Shortcuts
```bash
# Mode switching
Ctrl+P              # Pane mode
Ctrl+T              # Tab mode
Ctrl+R              # Resize mode
Ctrl+S              # Scroll mode
Ctrl+Q              # Quit mode

# Pane operations (in Pane mode)
n                   # New pane
x                   # Close pane
f                   # Toggle fullscreen
z                   # Toggle focus

# Tab operations (in Tab mode)
n                   # New tab
x                   # Close tab
r                   # Rename tab

# Navigation
Alt+h/j/k/l         # Navigate panes (vim-like)
Alt+n               # Next tab
Alt+p               # Previous tab
```

### Tmux Shortcuts (Prefix: Ctrl+B)
```bash
# Session management
Ctrl+B d            # Detach session
Ctrl+B s            # List sessions
Ctrl+B $            # Rename session

# Window management
Ctrl+B c            # Create window
Ctrl+B &            # Kill window
Ctrl+B n            # Next window
Ctrl+B p            # Previous window
Ctrl+B ,            # Rename window

# Pane management
Ctrl+B %            # Split horizontally
Ctrl+B "            # Split vertically
Ctrl+B x            # Kill pane
Ctrl+B o            # Switch panes
Ctrl+B z            # Toggle pane zoom

# Copy mode
Ctrl+B [            # Enter copy mode
Space               # Start selection
Enter               # Copy selection
Ctrl+B ]            # Paste
```

## 🎨 Theming and Appearance

### Color Schemes
All terminals use consistent color schemes that integrate with your system theme:

**Kitty Theme Integration:**
```conf
# kitty.conf
include ./theme.conf
background_opacity 0.95
dynamic_background_opacity yes
```

**Zellij Theme:**
```kdl
// config.kdl
theme "term"
themes {
    term {
        fg "#cdd6f4"
        bg "#1e1e2e"
        black "#45475a"
        red "#f38ba8"
        green "#a6e3a1"
        yellow "#f9e2af"
        blue "#89b4fa"
        magenta "#f5c2e7"
        cyan "#94e2d5"
        white "#bac2de"
    }
}
```

### Font Configuration
```conf
# Kitty font setup
font_family      JetBrains Mono Nerd Font
bold_font        JetBrains Mono Nerd Font Bold
italic_font      JetBrains Mono Nerd Font Italic
font_size        12.0

# Enable ligatures
disable_ligatures never
```

## 🔧 Customization

### Adding Custom Kitty Shortcuts
Edit `kitty.conf`:
```conf
# Custom shortcuts
map ctrl+shift+r load_config_file
map ctrl+shift+delete clear_terminal reset active
map ctrl+shift+f5 launch --location=hsplit
map ctrl+shift+f6 launch --location=vsplit
```

### Creating Zellij Layouts
Create custom layouts in `layouts/`:
```kdl
// layouts/dev.kdl
layout {
    pane size=1 borderless=true {
        plugin location="zellij:tab-bar"
    }
    pane split_direction="vertical" {
        pane split_direction="horizontal" {
            pane command="nvim"
            pane
        }
        pane size="30%" command="btop"
    }
    pane size=2 borderless=true {
        plugin location="zellij:status-bar"
    }
}
```

### Tmux Plugin Management
Add plugins to `tmux.conf`:
```bash
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Initialize TMUX plugin manager
run '~/.tmux/plugins/tpm/tpm'
```

### Performance Tuning

**Kitty Performance:**
```conf
# Reduce input delay
input_delay 3
repaint_delay 10
sync_to_monitor yes

# Memory management
scrollback_lines 10000
scrollback_pager_history_size 0
```

**Foot Performance:**
```ini
[main]
term=xterm-256color
app-id=foot
title=foot
locked-title=no

[scrollback]
lines=10000
multiplier=3.0
```

## 🔄 Session Management

### Zellij Sessions
```bash
# Create named session
zellij --session mysession

# List sessions
zellij list-sessions

# Attach to session
zellij attach mysession

# Kill session
zellij kill-session mysession
```

### Tmux Sessions
```bash
# Create named session
tmux new-session -s mysession

# List sessions
tmux list-sessions

# Attach to session
tmux attach-session -t mysession

# Kill session
tmux kill-session -t mysession
```

## 🛠️ Troubleshooting

### Common Issues

**Kitty not displaying images:**
```bash
# Check image support
kitty +kitten icat image.png

# Verify graphics protocol
echo $TERM
# Should show: xterm-kitty
```

**Zellij plugin issues:**
```bash
# Clear plugin cache
rm -rf ~/.cache/zellij

# Reinstall plugins
zellij setup --clean
```

**Tmux plugin problems:**
```bash
# Reload tmux config
tmux source-file ~/.config/tmux/tmux.conf

# Install/update plugins
Prefix + I  # Install
Prefix + U  # Update
```

### Performance Issues
```bash
# Check terminal performance
time ls -la /usr/bin

# Monitor resource usage
htop
# Look for terminal processes

# Test different terminals
hyperfine 'kitty --hold echo test' 'foot echo test'
```

## 📝 Notes

### Terminal Selection Guide
- **Kitty**: Best for feature-rich development with GPU acceleration
- **Foot**: Ideal for minimal Wayland setups with fast startup
- **Zellij**: Modern multiplexer with intuitive interface
- **Tmux**: Traditional multiplexer with extensive plugin ecosystem

### Integration Tips
- Use the same color scheme across all terminals
- Configure shell integration for better experience
- Set up proper font fallbacks for icon support
- Consider terminal-specific shell configurations

### Wayland Considerations
- Foot is native Wayland and most efficient
- Kitty has excellent Wayland support
- Some features may differ between X11 and Wayland

## 🔗 Related Modules

- **[Shell](../shell/README.md)**: Shell configurations that work with these terminals
- **[Editor](../editor/README.md)**: Editor integration with terminal multiplexers
- **[WM](../wm/README.md)**: Window manager integration and terminal launching