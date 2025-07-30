# 🎵 Media Configuration

Media player configuration and curated wallpaper collection for a complete multimedia and visual experience.

## 📦 What's Included

### MPV (`.config/mpv/`)
Minimalist media player with extensive customization:
- **`mpv.conf`**: Main configuration file
  - Video and audio output settings
  - Subtitle configuration
  - Performance optimizations
  - Keybinding customizations
  - Hardware acceleration setup

### Wallpapers (`Pictures/Wallpapers/`)
Curated collection of high-quality desktop wallpapers:
- **Pixel Art Collection**: Retro-inspired pixel art scenes
- **Atmospheric Scenes**: Cozy and ambient environments
- **Game-Inspired**: Video game aesthetic backgrounds
- **Minimalist**: Clean and simple designs
- **Seasonal**: Wallpapers for different times of year

## 🎬 MPV Features

### Video Playback
- **Hardware Acceleration**: GPU-accelerated decoding for smooth playback
- **High Quality Scaling**: Advanced upscaling algorithms for better image quality
- **HDR Support**: High Dynamic Range content playback
- **Multiple Formats**: Support for virtually all video formats
- **Streaming**: Direct URL playback for online content
- **Playlist Management**: Advanced playlist handling and navigation

### Audio Enhancement
- **Audio Filters**: Built-in audio processing and enhancement
- **Multiple Audio Tracks**: Support for multiple audio streams
- **Audio Normalization**: Automatic volume leveling
- **Surround Sound**: Multi-channel audio support
- **Audio Visualization**: Built-in spectrum analyzer

### Subtitle Support
- **Multiple Formats**: SRT, ASS, VTT, and more
- **Styling**: Custom subtitle appearance and positioning
- **Auto-loading**: Automatic subtitle detection and loading
- **Online Subtitles**: Integration with subtitle databases
- **Multiple Languages**: Multi-language subtitle support

## 🖼️ Wallpaper Collection

### Pixel Art Scenes
- **Autumn-Alley.jpg**: Cozy autumn street scene with warm lighting
- **DVD-Shop.jpg**: Nostalgic video rental store interior
- **Exchange-Shop.jpg**: Retro electronics exchange shop
- **Food-Truck.jpg**: Vibrant street food truck scene
- **Game-City.jpg**: Cyberpunk-inspired city landscape
- **Hardware-Shop.png**: Detailed computer hardware store
- **Lamen-Shop.png**: Traditional Japanese ramen shop
- **Tropical-Alley.jpg**: Lush tropical street scene
- **Vending-Machine.png**: Japanese vending machine alley
- **Zone-D1.jpg**: Industrial zone with atmospheric lighting

### Character and Gaming
- **Gameboy.png**: Classic Game Boy with nostalgic appeal
- **Mario-Chill.jpg**: Relaxed Mario-themed artwork
- **Sea-Of-Stars.png**: Beautiful RPG-inspired landscape
- **Lone-Robot.png**: Minimalist robot character design
- **Station.png**: Futuristic space station environment

### Usage Categories
- **Work/Productivity**: Minimal, non-distracting backgrounds
- **Gaming**: Vibrant, game-inspired scenes
- **Relaxation**: Cozy, atmospheric environments
- **Seasonal**: Weather and season-appropriate themes

## ⌨️ MPV Key Bindings

### Playback Control
```bash
# Basic playback
Space / p              # Play/pause
q                      # Quit
Q                      # Quit without saving position
. / ,                  # Step forward/backward one frame
< / >                  # Previous/next file in playlist

# Seeking
Left / Right           # Seek backward/forward 5 seconds
Shift+Left/Right       # Seek backward/forward 1 minute
Up / Down              # Seek forward/backward 1 minute
Page Up / Page Down    # Seek forward/backward 10 minutes
Home / End             # Go to beginning/end

# Speed control
[ / ]                  # Decrease/increase playback speed
Backspace              # Reset speed to normal
```

### Audio and Video
```bash
# Volume control
9 / 0                  # Decrease/increase volume
m                      # Mute/unmute
# / *                  # Decrease/increase volume (numpad)

# Audio tracks
#                      # Cycle audio tracks
Ctrl+#                 # Cycle audio tracks backward

# Video adjustments
1 / 2                  # Decrease/increase contrast
3 / 4                  # Decrease/increase brightness
5 / 6                  # Decrease/increase gamma
7 / 8                  # Decrease/increase saturation
```

### Subtitles
```bash
# Subtitle control
v                      # Toggle subtitle visibility
j / J                  # Cycle subtitle tracks forward/backward
z / Z                  # Adjust subtitle delay
r / R                  # Move subtitles up/down
t / T                  # Adjust subtitle font size
```

### Window and Display
```bash
# Window control
f                      # Toggle fullscreen
ESC                    # Exit fullscreen
d                      # Toggle frame dropping
o / O                  # Show/hide OSD
I                      # Show media information
P                      # Show progress bar
```

## 🔧 MPV Customization

### Basic Configuration
```ini
# mpv.conf

# Video settings
vo=gpu
hwdec=auto-safe
profile=gpu-hq
scale=ewa_lanczossharp
cscale=ewa_lanczossharp
video-sync=display-resample
interpolation
tscale=oversample

# Audio settings
ao=pulse
audio-file-auto=fuzzy
audio-pitch-correction=yes
volume=100
volume-max=200

# Subtitle settings
sub-auto=fuzzy
sub-file-paths-append=ass
sub-file-paths-append=srt
sub-file-paths-append=sub
sub-file-paths-append=subs
sub-file-paths-append=subtitles
slang=en,eng,english
sub-font="Inter"
sub-font-size=36
sub-color="#FFFFFF"
sub-border-color="#000000"
sub-border-size=2
sub-shadow-offset=1
sub-shadow-color="#33000000"

# Screenshot settings
screenshot-format=png
screenshot-png-compression=8
screenshot-template='~/Pictures/Screenshots/mpv-shot%n'

# OSD settings
osd-font="Inter"
osd-font-size=32
osd-color="#FFFFFF"
osd-border-color="#000000"
osd-border-size=2
osd-bar-align-y=0.85
osd-bar-h=2
osd-bar-w=60

# Window settings
keep-open=yes
save-position-on-quit
watch-later-directory="~/.config/mpv/watch_later"
```

### Advanced Profiles
```ini
# Profile for anime content
[anime]
profile-desc="Anime profile"
deband=yes
deband-iterations=2
deband-threshold=35
deband-range=20
deband-grain=5

# Profile for low-end hardware
[low-end]
profile-desc="Low-end hardware profile"
vo=gpu
hwdec=auto
scale=bilinear
cscale=bilinear
dscale=bilinear
interpolation=no
video-sync=audio

# Profile for high-end hardware
[high-end]
profile-desc="High-end hardware profile"
vo=gpu-next
hwdec=auto-copy-safe
scale=ewa_lanczossharp
cscale=ewa_lanczossharp
dscale=mitchell
interpolation=yes
video-sync=display-resample
```

### Custom Key Bindings
```ini
# input.conf

# Custom shortcuts
Ctrl+s screenshot
Ctrl+S screenshot video
Alt+s screenshot subtitles
Ctrl+r cycle_values video-rotate 90 180 270 0

# Playlist navigation
Ctrl+Right playlist-next
Ctrl+Left playlist-prev
Ctrl+Up playlist-shuffle
Ctrl+Down playlist-unshuffle

# Audio/video sync
+ add audio-delay 0.100
- add audio-delay -0.100
= set audio-delay 0

# Chapter navigation
Ctrl+. add chapter 1
Ctrl+, add chapter -1

# Zoom and pan
Alt++ add video-zoom 0.1
Alt+- add video-zoom -0.1
Alt+0 set video-zoom 0
```

## 🎨 Wallpaper Management

### Wallpaper Rotation Script
```bash
#!/bin/bash
# wallpaper-rotate.sh

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CURRENT_WALLPAPER="$HOME/.current_wallpaper"

# Get random wallpaper
get_random_wallpaper() {
    find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1
}

# Set wallpaper based on WM
set_wallpaper() {
    local wallpaper="$1"
    
    if command -v swww >/dev/null 2>&1; then
        # Hyprland with swww
        swww img "$wallpaper" --transition-type wipe --transition-duration 2
    elif command -v feh >/dev/null 2>&1; then
        # X11 with feh
        feh --bg-scale "$wallpaper"
    elif command -v nitrogen >/dev/null 2>&1; then
        # X11 with nitrogen
        nitrogen --set-scaled "$wallpaper"
    fi
    
    # Save current wallpaper
    echo "$wallpaper" > "$CURRENT_WALLPAPER"
    
    # Generate color scheme if matugen is available
    if command -v matugen >/dev/null 2>&1; then
        matugen image "$wallpaper"
    fi
}

# Main execution
case "$1" in
    "random")
        wallpaper=$(get_random_wallpaper)
        set_wallpaper "$wallpaper"
        echo "Set wallpaper: $(basename "$wallpaper")"
        ;;
    "current")
        if [[ -f "$CURRENT_WALLPAPER" ]]; then
            cat "$CURRENT_WALLPAPER"
        else
            echo "No current wallpaper set"
        fi
        ;;
    *)
        if [[ -f "$1" ]]; then
            set_wallpaper "$1"
            echo "Set wallpaper: $(basename "$1")"
        else
            echo "Usage: $0 {random|current|/path/to/wallpaper}"
            echo "Available wallpapers:"
            ls -1 "$WALLPAPER_DIR"
        fi
        ;;
esac
```

### Wallpaper Categories
```bash
#!/bin/bash
# wallpaper-categories.sh

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Categorize wallpapers
declare -A categories=(
    ["cozy"]="Autumn-Alley.jpg Lamen-Shop.png Food-Truck.jpg"
    ["retro"]="DVD-Shop.jpg Exchange-Shop.jpg Hardware-Shop.png Gameboy.png"
    ["gaming"]="Game-City.jpg Mario-Chill.jpg Sea-Of-Stars.png Station.png"
    ["minimal"]="Lone-Robot.png"
    ["tropical"]="Tropical-Alley.jpg"
    ["urban"]="Vending-Machine.png Zone-D1.jpg"
)

# Set wallpaper by category
set_category_wallpaper() {
    local category="$1"
    if [[ -n "${categories[$category]}" ]]; then
        local wallpapers=(${categories[$category]})
        local random_wallpaper="${wallpapers[$RANDOM % ${#wallpapers[@]}]}"
        ./wallpaper-rotate.sh "$WALLPAPER_DIR/$random_wallpaper"
    else
        echo "Unknown category: $category"
        echo "Available categories: ${!categories[@]}"
    fi
}

# Usage
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <category>"
    echo "Available categories:"
    for category in "${!categories[@]}"; do
        echo "  $category: ${categories[$category]}"
    done
else
    set_category_wallpaper "$1"
fi
```

## 🔄 Integration

### System Integration
```bash
# Shell aliases for media
alias play='mpv'
alias music='mpv --no-video'
alias wallpaper='~/scripts/wallpaper-rotate.sh'
alias wp-random='wallpaper random'
alias wp-cozy='~/scripts/wallpaper-categories.sh cozy'
alias wp-retro='~/scripts/wallpaper-categories.sh retro'

# Fish abbreviations
abbr play mpv
abbr music 'mpv --no-video'
abbr wp wallpaper
```

### Desktop Environment Integration
```bash
# Automatic wallpaper rotation (systemd timer)
# ~/.config/systemd/user/wallpaper-rotate.service
[Unit]
Description=Rotate wallpaper
After=graphical-session.target

[Service]
Type=oneshot
ExecStart=%h/scripts/wallpaper-rotate.sh random

# ~/.config/systemd/user/wallpaper-rotate.timer
[Unit]
Description=Rotate wallpaper every hour
Requires=wallpaper-rotate.service

[Timer]
OnCalendar=hourly
Persistent=true

[Install]
WantedBy=timers.target
```

### Theme Integration
```bash
# Extract colors from current wallpaper
extract_wallpaper_colors() {
    local wallpaper="$(cat ~/.current_wallpaper)"
    if [[ -f "$wallpaper" ]]; then
        # Use matugen to extract colors
        matugen image "$wallpaper" --dry-run --json | jq -r '.colors.dark'
    fi
}

# Apply wallpaper-based theme
apply_wallpaper_theme() {
    local wallpaper="$1"
    
    # Set wallpaper
    ./wallpaper-rotate.sh "$wallpaper"
    
    # Generate and apply color scheme
    if command -v matugen >/dev/null 2>&1; then
        matugen image "$wallpaper"
        
        # Reload applications
        pkill -SIGUSR1 waybar
        pkill -SIGUSR1 dunst
    fi
}
```

## 📱 Mobile and Remote Access

### MPV Remote Control
```bash
# Enable IPC for remote control
# Add to mpv.conf
input-ipc-server=/tmp/mpvsocket

# Remote control script
#!/bin/bash
# mpv-remote.sh
case "$1" in
    "play") echo 'cycle pause' | socat - /tmp/mpvsocket ;;
    "stop") echo 'quit' | socat - /tmp/mpvsocket ;;
    "next") echo 'playlist-next' | socat - /tmp/mpvsocket ;;
    "prev") echo 'playlist-prev' | socat - /tmp/mpvsocket ;;
    "vol-up") echo 'add volume 5' | socat - /tmp/mpvsocket ;;
    "vol-down") echo 'add volume -5' | socat - /tmp/mpvsocket ;;
esac
```

## 🔗 Related Modules

- **[Theme](../theme/README.md)**: Color extraction and theming from wallpapers
- **[WM](../wm/README.md)**: Wallpaper integration with window managers
- **[Tools](../tools/README.md)**: Media management and organization tools
- **[System](../system/README.md)**: System-wide media handling and integration