# 🏠 Arthur's Dotfiles

A carefully curated collection of configuration files for a modern Linux development environment, organized with GNU Stow for easy management and deployment.

## 🎯 Philosophy

These dotfiles embrace the Unix philosophy of doing one thing well. Each configuration is thoughtfully crafted to provide a seamless, efficient, and aesthetically pleasing computing experience across different machines.

## 📦 What's Inside

### 🐚 Shell (`shell/`)
- **Fish Shell**: Modern shell with intelligent autocompletions
- **Zsh**: Powerful shell with custom configurations
- **Starship**: Cross-shell prompt with git integration and performance metrics
- **Bash**: Fallback shell configuration

### 💻 Terminal (`terminal/`)
- **Kitty**: GPU-accelerated terminal with ligature support
- **Foot**: Lightweight Wayland terminal
- **Zellij**: Modern terminal multiplexer with layouts and plugins
- **Tmux**: Traditional terminal multiplexer for session management

### ✏️ Editor (`editor/`)
- **Neovim**: Modern Vim with LSP, treesitter, and plugin ecosystem
- **Micro**: Simple, intuitive terminal-based text editor

### 🪟 Window Manager (`wm/`)
- **Hyprland**: Dynamic tiling Wayland compositor
- **BSPWM**: Binary space partitioning window manager
- **Waybar**: Highly customizable Wayland bar
- **Rofi**: Application launcher and window switcher
- **Fuzzel**: Fast application launcher for Wayland
- **Dunst**: Lightweight notification daemon
- **Polybar**: Fast and easy-to-use status bar
- **Swaylock**: Screen locker for Wayland
- **Wlogout**: Logout menu for Wayland

### 🛠️ Tools (`tools/`)
- **Git**: Version control with aliases and configurations
- **Lazygit**: Terminal UI for git commands
- **Ranger**: Console file manager with VI key bindings
- **Btop**: Resource monitor with a sleek interface
- **Fastfetch**: System information tool
- **Cava**: Console-based audio visualizer
- **LSD**: Modern replacement for ls with colors and icons
- **Fontconfig**: Font configuration and customization
- **Matugen**: Material You color generation tool
- **Redshift**: Blue light filter for eye strain reduction

### 🎨 Theme (`theme/`)
- **GTK 3/4**: Consistent theming across GTK applications
- **Qt5/Qt6**: Qt application theming
- **Kvantum**: SVG-based theme engine for Qt applications

### 🎵 Media (`media/`)
- **MPV**: Minimalist media player with extensive customization
- **Wallpapers**: Curated collection of beautiful desktop wallpapers

### 🤖 AI (`ai/`)
- **OpenCode**: Configuration for the AI-powered coding assistant
- **Claude**: Settings and preferences for Claude AI interactions
- **AI Tools**: Configurations for modern AI development workflow

### 📱 Apps (`apps/`)
- **Browser Flags**: Performance and feature flags for Chrome, Thorium, and VSCode
- **Application Optimizations**: Custom flags for better performance and functionality

### ⚙️ System (`system/`)
- **XDG Desktop Portal**: Desktop integration for sandboxed applications
- **System Integration**: Configurations for seamless desktop experience

## 🚀 Quick Start

### Prerequisites

Ensure you have GNU Stow installed:

```bash
# Arch Linux
sudo pacman -S stow

# Ubuntu/Debian
sudo apt install stow

# macOS
brew install stow
```

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/arthur404dev/dots.git ~/.dots
   cd ~/.dots
   ```

2. **Backup existing configurations:**
   ```bash
   # Create backup directory
   mkdir -p ~/.config-backup
   
   # Backup existing configs (optional but recommended)
   cp -r ~/.config/* ~/.config-backup/ 2>/dev/null || true
   ```

3. **Stow individual packages:**
   ```bash
   # Install shell configurations
   stow shell
   
   # Install terminal configurations
   stow terminal
   
   # Install editor configurations
   stow editor
   
   # Install window manager configurations
   stow wm
   
   # Install tools configurations
   stow tools
   
   # Install theme configurations
   stow theme
   
    # Install media configurations
    stow media
    
    # Install AI configurations
    stow ai
    
    # Install app configurations
    stow apps
    
    # Install system configurations
    stow system
    ```
4. **Or install everything at once:**
   ```bash
   stow */
   ```

### Selective Installation

You can install only the configurations you need:

```bash
# Just shell and editor
stow shell editor

# Just window manager setup
stow wm theme

# Everything except window manager
stow shell terminal editor tools media ai apps system
```

### 🚀 Usage Examples

```bash
# Install just the essentials
stow shell terminal editor

# Install everything including new packages
stow */

# Install specific workflows
stow shell terminal tools wm theme  # Development + WM setup
stow ai apps system                 # AI tools + System integration
stow media                          # Media player + Wallpapers

# AI-focused development setup
stow shell terminal editor ai tools

# Complete desktop environment
stow wm theme system apps
```

## 🔧 Customization

### Modifying Configurations

1. Edit files directly in the stow directories
2. Re-stow to apply changes:
   ```bash
   stow -R shell  # Restow shell configurations
   ```

### Adding New Configurations

1. Create a new directory for your application
2. Mirror the home directory structure
3. Add your configuration files
4. Stow the new package

Example:
```bash
mkdir -p mynewapp/.config/mynewapp
cp ~/.config/mynewapp/config mynewapp/.config/mynewapp/
stow mynewapp
```

## 🗂️ Directory Structure

```
dots/
├── .stowrc              # Stow configuration (ignore patterns)
├── README.md            # This file
├── shell/               # Shell configurations
│   ├── .bashrc
│   ├── .zshrc
│   └── .config/
│       ├── fish/
│       ├── starship.toml
│       └── zshrc.d/
├── terminal/            # Terminal emulator configs
│   └── .config/
│       ├── kitty/
│       ├── foot/
│       ├── zellij/
│       └── tmux/
├── editor/              # Text editor configurations
│   └── .config/
│       ├── nvim/
│       └── micro/
├── wm/                  # Window manager configurations
│   └── .config/
│       ├── hypr/
│       ├── bspwm/
│       ├── waybar/
│       ├── rofi/
│       ├── fuzzel/
│       ├── dunst/
│       ├── polybar/
│       ├── swaylock/
│       └── wlogout/
├── tools/               # CLI tools and utilities
│   └── .config/
│       ├── git/
│       ├── lazygit/
│       ├── ranger/
│       ├── btop/
│       ├── fastfetch/
│       ├── cava/
│       ├── lsd/
│       ├── fontconfig/
│       ├── matugen/
│       └── redshift/
├── theme/               # Theming configurations
│   └── .config/
│       ├── gtk-3.0/
│       ├── gtk-4.0/
│       ├── qt5ct/
│       ├── qt6ct/
│       ├── Kvantum/
│       ├── gtkrc
│       └── gtkrc-2.0
├── media/               # Media applications and assets
│   ├── .config/
│   │   └── mpv/
│   └── Pictures/
│       └── Wallpapers/
├── ai/                  # AI tools and assistants
│   ├── .config/
│   │   └── opencode/
│   └── .claude/
├── apps/                # Application configurations
│   └── .config/
│       ├── chrome-flags.conf
│       ├── code-flags.conf
│       └── thorium-flags.conf
└── system/              # System integration
    └── .config/
        ├── xdg-desktop-portal/
        └── xdg-desktop-portal-kderc
```

## 🔄 Management Commands

### Useful Stow Commands

```bash
# Install/link configurations
stow package_name

# Remove/unlink configurations
stow -D package_name

# Reinstall (useful after editing)
stow -R package_name

# Simulate actions (dry run)
stow -n package_name

# Verbose output
stow -v package_name
```

### Maintenance

```bash
# Check for broken symlinks
find ~ -xtype l -print

# Update from git
git pull origin main

# Restow everything after updates
stow -R */
```

## 🤝 Contributing

Feel free to fork this repository and adapt it to your needs. If you have improvements or suggestions, pull requests are welcome!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- The GNU Stow maintainers for this excellent tool
- The open-source community for the amazing applications configured here
- Everyone who shares their dotfiles and inspires others

---

*"The best dotfiles are the ones that make you forget they exist while making everything work perfectly."*
