# 🪟 Window Manager Configuration

Comprehensive window manager setups for both X11 and Wayland, featuring tiling window managers, status bars, launchers, and desktop utilities.

## 📦 What's Included

### Hyprland (`.config/hypr/`)
Modern Wayland compositor with advanced features:
- **`hyprland.conf`**: Main configuration file
- **`hyprland/`**: Modular configuration directory
  - Window rules and workspace setup
  - Input device configurations
  - Animation and visual effects
- **`hypridle.conf`**: Idle management and screen locking
- **`hyprlock.conf`**: Screen lock configuration
- **`hyprlock/`**: Lock screen assets and themes
- **`custom/`**: Custom scripts and utilities
- **`shaders/`**: Custom OpenGL shaders for effects

### BSPWM (`.config/bspwm/`)
Binary space partitioning window manager for X11:
- **`bspwmrc`**: Main configuration and startup script
- **`sxhkdrc`**: Hotkey daemon configuration
- **`picom.conf`**: Compositor configuration for transparency and effects

### Waybar (`.config/waybar/`)
Highly customizable status bar for Wayland:
- **`config.jsonc`**: Bar configuration with modules
- **`style.css`**: Custom styling and themes

### Rofi (`.config/rofi/`)
Application launcher and window switcher:
- **`config.rasi`**: Main configuration
- **`theme.rasi`**: Custom theme and styling
- **`emoji.rasi`**: Emoji picker configuration
- **`selecting.rasi`**: Selection menu styling

### Fuzzel (`.config/fuzzel/`)
Fast application launcher for Wayland:
- **`fuzzel.ini`**: Main configuration
- **`fuzzel_theme.ini`**: Theme and appearance settings

### Dunst (`.config/dunst/`)
Lightweight notification daemon:
- **`dunstrc`**: Notification appearance and behavior

### Polybar (`.config/polybar/`)
Fast and customizable status bar for X11:
- **`config.ini`**: Bar modules and configuration
- **`launch.sh`**: Startup script for multiple monitors

### Swaylock (`.config/swaylock/`)
Screen locker for Wayland:
- **`config`**: Lock screen appearance and behavior

### Wlogout (`.config/wlogout/`)
Logout menu for Wayland:
- **`layout`**: Button layout configuration
- **`style.css`**: Menu styling and animations

## 🚀 Key Features

### Hyprland Features
- **Tiling Management**: Automatic window tiling with manual override
- **Workspaces**: Dynamic workspace creation and management
- **Animations**: Smooth window animations and transitions
- **Multi-Monitor**: Advanced multi-monitor support
- **Input Management**: Per-device input configuration
- **Window Rules**: Automatic window placement and behavior
- **IPC**: Scriptable via hyprctl commands

### BSPWM Features
- **Binary Partitioning**: Unique tiling algorithm
- **Manual Tiling**: Full control over window placement
- **Monocle Mode**: Fullscreen window cycling
- **Multi-Monitor**: Independent workspace per monitor
- **Scriptable**: Extensive scripting capabilities
- **Minimal**: Lightweight and fast

### Status Bar Features (Waybar/Polybar)
- **System Monitoring**: CPU, memory, disk usage
- **Network Status**: WiFi, Ethernet connection info
- **Audio Control**: Volume and device switching
- **Workspace Indicators**: Current workspace highlighting
- **Clock/Calendar**: Date and time display
- **Custom Modules**: Extensible with custom scripts

## ⌨️ Key Bindings

### Hyprland Shortcuts
```bash
# Window management
Super+Q                 # Close window
Super+V                 # Toggle floating
Super+F                 # Toggle fullscreen
Super+P                 # Toggle pseudo-tiling

# Focus movement
Super+H/J/K/L          # Move focus (vim-like)
Super+Left/Down/Up/Right # Move focus (arrows)

# Window movement
Super+Shift+H/J/K/L    # Move window (vim-like)
Super+Shift+Arrows     # Move window (arrows)

# Workspaces
Super+1-9              # Switch to workspace
Super+Shift+1-9        # Move window to workspace
Super+S                # Special workspace (scratchpad)

# Applications
Super+Return           # Terminal
Super+D                # Application launcher
Super+E                # File manager

# System
Super+L                # Lock screen
Super+Shift+E          # Logout menu
```

### BSPWM Shortcuts (via sxhkd)
```bash
# Window management
Super+W                # Close window
Super+M                # Toggle monocle mode
Super+Y                # Send newest marked node to newest preselected node
Super+G                # Swap current node with biggest node

# Focus/Movement
Super+H/J/K/L         # Focus window (vim-like)
Super+Shift+H/J/K/L   # Move window (vim-like)
Super+C               # Focus next window
Super+Shift+C         # Focus previous window

# Workspaces
Super+1-9             # Focus desktop
Super+Shift+1-9       # Send window to desktop

# Preselection
Super+Ctrl+H/J/K/L    # Preselect direction
Super+Ctrl+1-9        # Preselect ratio
Super+Ctrl+Space      # Cancel preselection

# Applications
Super+Return          # Terminal
Super+Space           # Program launcher
Super+E               # File manager
```

### Rofi/Fuzzel Shortcuts
```bash
# Navigation
Up/Down               # Navigate options
Tab                   # Next option
Shift+Tab             # Previous option
Enter                 # Select option
Escape                # Cancel

# Filtering
Type                  # Filter results
Ctrl+U                # Clear filter
```

## 🎨 Theming and Appearance

### Hyprland Visual Effects
```conf
# hyprland.conf
decoration {
    rounding = 10
    blur {
        enabled = true
        size = 8
        passes = 1
    }
    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}
```

### Waybar Styling
```css
/* style.css */
* {
    font-family: "JetBrains Mono Nerd Font";
    font-size: 13px;
}

window#waybar {
    background-color: rgba(43, 48, 59, 0.8);
    border-bottom: 3px solid rgba(100, 114, 125, 0.5);
    color: #ffffff;
    transition-property: background-color;
    transition-duration: .5s;
}

#workspaces button {
    padding: 0 5px;
    background-color: transparent;
    color: #ffffff;
    border: none;
    border-radius: 0;
}

#workspaces button:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.active {
    background-color: #64727D;
    box-shadow: inset 0 -3px #ffffff;
}
```

### Dunst Notification Styling
```ini
# dunstrc
[global]
    width = 300
    height = 300
    offset = 10x50
    origin = top-right
    transparency = 10
    frame_color = "#89B4FA"
    font = JetBrains Mono Nerd Font 10

[urgency_low]
    background = "#1E1E2E"
    foreground = "#CDD6F4"
    timeout = 10

[urgency_normal]
    background = "#1E1E2E"
    foreground = "#CDD6F4"
    timeout = 10

[urgency_critical]
    background = "#1E1E2E"
    foreground = "#CDD6F4"
    frame_color = "#FAB387"
    timeout = 0
```

## 🔧 Customization

### Adding Custom Hyprland Rules
```conf
# Window rules
windowrule = float, ^(pavucontrol)$
windowrule = float, ^(blueman-manager)$
windowrule = float, ^(nm-connection-editor)$
windowrule = float, ^(chromium)$
windowrule = float, ^(thunar)$

# Workspace rules
windowrule = workspace 2, ^(firefox)$
windowrule = workspace 3, ^(code)$
windowrule = workspace 4, ^(discord)$

# Opacity rules
windowrule = opacity 0.8 0.8, ^(kitty)$
windowrule = opacity 0.9 0.9, ^(code)$
```

### Custom BSPWM Rules
```bash
# bspwmrc
bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a Firefox desktop='^2'
bspc rule -a Code desktop='^3'
bspc rule -a Discord desktop='^4'
```

### Waybar Custom Modules
```json
// config.jsonc
{
    "modules-left": ["hyprland/workspaces", "hyprland/mode", "custom/media"],
    "modules-center": ["hyprland/window"],
    "modules-right": ["idle_inhibitor", "pulseaudio", "network", "cpu", "memory", "temperature", "backlight", "battery", "clock", "tray"],
    
    "custom/media": {
        "format": "{icon} {}",
        "return-type": "json",
        "max-length": 40,
        "format-icons": {
            "spotify": "",
            "default": "🎜"
        },
        "escape": true,
        "exec": "$HOME/.config/waybar/mediaplayer.py 2> /dev/null"
    }
}
```

## 🛠️ Scripts and Automation

### Hyprland Startup Script
```bash
#!/bin/bash
# custom/autostart.sh

# Start essential services
waybar &
dunst &
swww init &

# Set wallpaper
swww img ~/Pictures/Wallpapers/current.jpg &

# Start applications
firefox &
discord &
```

### BSPWM Startup Script
```bash
#!/bin/bash
# bspwmrc

# Monitor setup
bspc monitor -d I II III IV V VI VII VIII IX X

# Configuration
bspc config border_width         2
bspc config window_gap          12
bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

# Start services
sxhkd &
picom &
polybar example &
```

### Custom Rofi Scripts
```bash
#!/bin/bash
# Power menu script
options="⇠ Logout\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case $chosen in
    "⇠ Logout")
        hyprctl dispatch exit
        ;;
    "⏾ Suspend")
        systemctl suspend
        ;;
    "⭮ Reboot")
        systemctl reboot
        ;;
    "⏻ Shutdown")
        systemctl poweroff
        ;;
esac
```

## 🔄 Multi-Monitor Setup

### Hyprland Multi-Monitor
```conf
# Monitor configuration
monitor=DP-1,2560x1440@144,0x0,1
monitor=HDMI-A-1,1920x1080@60,2560x0,1

# Workspace binding
workspace=1,monitor:DP-1
workspace=2,monitor:DP-1
workspace=3,monitor:DP-1
workspace=4,monitor:HDMI-A-1
workspace=5,monitor:HDMI-A-1
```

### BSPWM Multi-Monitor
```bash
# bspwmrc
if [[ $(xrandr -q | grep ' connected' | wc -l) -eq 2 ]]; then
    bspc monitor DP-1 -d I II III IV V
    bspc monitor HDMI-1 -d VI VII VIII IX X
else
    bspc monitor -d I II III IV V VI VII VIII IX X
fi
```

## 🔒 Security and Privacy

### Screen Locking
```conf
# hypridle.conf
general {
    lock_cmd = pidof hyprlock || hyprlock
    before_sleep_cmd = loginctl lock-session
    after_sleep_cmd = hyprctl dispatch dpms on
}

listener {
    timeout = 150
    on-timeout = brightnessctl -s set 10
    on-resume = brightnessctl -r
}

listener {
    timeout = 300
    on-timeout = loginctl lock-session
}

listener {
    timeout = 330
    on-timeout = hyprctl dispatch dpms off
    on-resume = hyprctl dispatch dpms on
}
```

## 📝 Troubleshooting

### Common Hyprland Issues
```bash
# Check Hyprland logs
journalctl -u hyprland --user -f

# Reload configuration
hyprctl reload

# Check window information
hyprctl clients

# Monitor information
hyprctl monitors
```

### BSPWM Debugging
```bash
# Check bspwm status
bspc query -T

# Window information
bspc query -W

# Desktop information
bspc query -D
```

### Performance Optimization
```conf
# Hyprland performance settings
decoration {
    blur {
        enabled = false  # Disable for better performance
    }
}

animations {
    enabled = false  # Disable for better performance
}

misc {
    force_default_wallpaper = 0
    disable_hyprland_logo = true
}
```

## 🔗 Related Modules

- **[Terminal](../terminal/README.md)**: Terminal emulators optimized for tiling WMs
- **[Theme](../theme/README.md)**: Consistent theming across WM components
- **[Apps](../apps/README.md)**: Application-specific optimizations for WMs
- **[System](../system/README.md)**: System integration and desktop portals