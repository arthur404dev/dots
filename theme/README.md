# 🎨 Theme Configuration

Comprehensive theming system for consistent visual appearance across GTK, Qt, and system applications, featuring Material You integration and custom color schemes.

## 📦 What's Included

### GTK 3 (`.config/gtk-3.0/`)
GTK3 application theming:
- **`settings.ini`**: Theme selection and preferences
- **`gtk.css`**: Custom CSS overrides and modifications
- **`bookmarks`**: File manager bookmarks

### GTK 4 (`.config/gtk-4.0/`)
Modern GTK4 application theming:
- **`settings.ini`**: GTK4-specific theme settings
- **`gtk.css`**: GTK4 custom styling and overrides

### Qt5 (`.config/qt5ct/`)
Qt5 application theming:
- **`qt5ct.conf`**: Theme, font, and icon settings
- Color scheme integration
- Widget styling preferences

### Qt6 (`.config/qt6ct/`)
Qt6 application theming:
- **`qt6ct.conf`**: Modern Qt6 theme configuration
- Consistent styling with Qt5
- Enhanced widget theming

### Kvantum (`.config/Kvantum/`)
Advanced Qt theme engine:
- **`kvantum.kvconfig`**: Global Kvantum settings
- **`Colloid/`**: Colloid theme configuration
  - Modern, clean design
  - Consistent with GTK themes
- **`MaterialAdw/`**: Material Design theme
  - Material You integration
  - Adaptive color schemes

### Legacy GTK (`.config/`)
Traditional GTK theming:
- **`gtkrc`**: GTK2 theme configuration
- **`gtkrc-2.0`**: GTK2 application styling

## 🚀 Key Features

### Unified Design Language
- **Consistent Colors**: Coordinated color palette across all toolkits
- **Typography**: Unified font choices and sizing
- **Spacing**: Consistent padding and margins
- **Icons**: Coherent icon themes across applications
- **Animations**: Smooth transitions and effects

### Material You Integration
- **Dynamic Colors**: Colors extracted from wallpaper
- **Adaptive Themes**: Light and dark mode support
- **Color Harmony**: Scientifically balanced color relationships
- **Accessibility**: High contrast and readability options

### Cross-Toolkit Compatibility
- **GTK Applications**: GNOME apps, file managers, text editors
- **Qt Applications**: KDE apps, development tools, media players
- **Electron Apps**: VSCode, Discord, web-based applications
- **Legacy Support**: Older GTK2 and Qt4 applications

## 🎨 Color Schemes

### Primary Color Palette
```css
/* Base colors */
--background: #1e1e2e;
--surface: #313244;
--primary: #89b4fa;
--secondary: #f38ba8;
--accent: #a6e3a1;

/* Text colors */
--on-background: #cdd6f4;
--on-surface: #cdd6f4;
--on-primary: #1e1e2e;
--on-secondary: #1e1e2e;
--on-accent: #1e1e2e;

/* State colors */
--error: #f38ba8;
--warning: #f9e2af;
--success: #a6e3a1;
--info: #89dceb;
```

### Theme Variants
- **Dark Mode**: Primary theme with dark backgrounds
- **Light Mode**: Light variant for daytime use
- **High Contrast**: Enhanced contrast for accessibility
- **Colorblind Friendly**: Adjusted colors for color vision deficiency

## 🔧 Customization

### GTK Theme Customization
```css
/* gtk.css - Custom overrides */
.titlebar {
    background: @theme_bg_color;
    border-bottom: 1px solid @borders;
}

.sidebar {
    background: shade(@theme_bg_color, 0.95);
    border-right: 1px solid @borders;
}

button {
    border-radius: 6px;
    padding: 8px 16px;
    transition: all 200ms ease;
}

button:hover {
    background: alpha(@theme_selected_bg_color, 0.1);
}

/* Custom scrollbars */
scrollbar slider {
    background: alpha(@theme_fg_color, 0.3);
    border-radius: 10px;
    min-width: 8px;
    min-height: 8px;
}

scrollbar slider:hover {
    background: alpha(@theme_fg_color, 0.5);
}
```

### Qt Theme Configuration
```ini
# qt5ct.conf
[Appearance]
color_scheme_path=/usr/share/qt5ct/colors/custom.conf
custom_palette=true
icon_theme=Papirus-Dark
standard_dialogs=default
style=kvantum-dark

[Fonts]
fixed=@Variant(\0\0\0@\0\0\0\x12\0J\0\x65\0t\0\x42\0r\0\x61\0i\0n\0s\0 \0M\0o\0n\0o@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)
general=@Variant(\0\0\0@\0\0\0\x12\0I\0n\0t\0\x65\0r@(\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
keyboard_scheme=2
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3
```

### Kvantum Theme Creation
```ini
# Colloid.kvconfig
[%General]
author=Colloid Theme
comment=A modern theme
x11drag=menubar_and_primary_toolbar
alt_mnemonic=true
left_tabs=true
attach_active_tab=false
mirror_doc_tabs=true
group_toolbar_buttons=false
toolbar_item_spacing=0
toolbar_interior_spacing=2
spread_progressbar=true
composite=true
menu_shadow_depth=7
tooltip_shadow_depth=6
splitter_width=1
scroll_width=12
scroll_arrows=false
scroll_min_extent=36
slider_width=6
slider_handle_width=16
slider_handle_length=16
center_toolbar_handle=true
check_size=16
textless_progressbar=false
progressbar_thickness=2
menubar_mouse_tracking=true
toolbutton_style=1
double_click=false
translucent_windows=true
blurring=true
popup_blurring=false
vertical_spin_indicators=false
spin_button_width=16
fill_rubberband=false
merge_menubar_with_toolbar=true
small_icon_size=16
large_icon_size=32
button_icon_size=16
toolbar_icon_size=16
combo_as_lineedit=true
animate_states=true
button_contents_shift=false
combo_menu=true
hide_combo_checkboxes=true
combo_focus_rect=true
groupbox_top_label=true
inline_spin_indicators=true
joined_inactive_tabs=true
layout_spacing=6
layout_margin=9
scrollbar_in_view=true
transient_scrollbar=false
transient_groove=true
submenu_overlap=0
tooltip_delay=-1
tree_branch_line=true
no_window_pattern=false
opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux2_qt5,kamoso,QtCreator,VirtualBox,trojita,dragon,digikam
```

## 🖼️ Icon Themes

### Icon Theme Selection
```ini
# Recommended icon themes
Papirus-Dark          # Modern, comprehensive icon set
Tela-circle-dark      # Circular icons with good coverage
Fluent-dark           # Microsoft Fluent design icons
Adwaita               # GNOME default icons
Breeze-dark           # KDE default icons
```

### Custom Icon Configuration
```ini
# Icon theme inheritance
[Icon Theme]
Name=Custom-Dark
Comment=Custom dark icon theme
Inherits=Papirus-Dark,Adwaita,hicolor
Directories=16x16/apps,22x22/apps,24x24/apps,32x32/apps,48x48/apps,64x64/apps

[16x16/apps]
Size=16
Context=Applications
Type=Fixed

[22x22/apps]
Size=22
Context=Applications
Type=Fixed
```

## 🔄 Dynamic Theming

### Material You Integration
```toml
# matugen integration
[config]
reload_apps = true
set_wallpaper = false

[templates.gtk3]
input_path = "~/.config/matugen/templates/gtk3.css"
output_path = "~/.config/gtk-3.0/gtk.css"

[templates.gtk4]
input_path = "~/.config/matugen/templates/gtk4.css"
output_path = "~/.config/gtk-4.0/gtk.css"

[templates.qt5ct]
input_path = "~/.config/matugen/templates/qt5ct.conf"
output_path = "~/.config/qt5ct/qt5ct.conf"

[templates.kvantum]
input_path = "~/.config/matugen/templates/kvantum.kvconfig"
output_path = "~/.config/Kvantum/Generated/Generated.kvconfig"
```

### Theme Switching Scripts
```bash
#!/bin/bash
# theme-switch.sh

THEME_MODE="$1"

case "$THEME_MODE" in
    "dark")
        # GTK themes
        gsettings set org.gnome.desktop.interface gtk-theme "Adw-dark"
        gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
        
        # Qt themes
        export QT_STYLE_OVERRIDE=kvantum-dark
        
        # Icon theme
        gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
        ;;
    "light")
        # GTK themes
        gsettings set org.gnome.desktop.interface gtk-theme "Adw"
        gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
        
        # Qt themes
        export QT_STYLE_OVERRIDE=kvantum
        
        # Icon theme
        gsettings set org.gnome.desktop.interface icon-theme "Papirus"
        ;;
esac

# Reload applications
killall -SIGUSR1 waybar
```

## 🎯 Application-Specific Theming

### Browser Theming
```css
/* Custom CSS for web applications */
:root {
    --bg-color: #1e1e2e;
    --fg-color: #cdd6f4;
    --accent-color: #89b4fa;
    --border-color: #313244;
}

/* Discord theming */
.theme-dark {
    --background-primary: var(--bg-color);
    --background-secondary: var(--border-color);
    --text-normal: var(--fg-color);
    --interactive-active: var(--accent-color);
}
```

### Terminal Theming
```conf
# Terminal color scheme
[colors]
background = "#1e1e2e"
foreground = "#cdd6f4"

# Black
color0 = "#45475a"
color8 = "#585b70"

# Red
color1 = "#f38ba8"
color9 = "#f38ba8"

# Green
color2 = "#a6e3a1"
color10 = "#a6e3a1"

# Yellow
color3 = "#f9e2af"
color11 = "#f9e2af"

# Blue
color4 = "#89b4fa"
color12 = "#89b4fa"

# Magenta
color5 = "#f5c2e7"
color13 = "#f5c2e7"

# Cyan
color6 = "#94e2d5"
color14 = "#94e2d5"

# White
color7 = "#bac2de"
color15 = "#a6adc8"
```

## 🔧 Font Configuration

### System Fonts
```xml
<!-- fontconfig configuration -->
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <!-- Default fonts -->
    <alias>
        <family>serif</family>
        <prefer>
            <family>Noto Serif</family>
        </prefer>
    </alias>
    
    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>Inter</family>
            <family>Noto Sans</family>
        </prefer>
    </alias>
    
    <alias>
        <family>monospace</family>
        <prefer>
            <family>JetBrains Mono Nerd Font</family>
            <family>Fira Code</family>
        </prefer>
    </alias>
    
    <!-- Font rendering -->
    <match target="font">
        <edit name="antialias" mode="assign">
            <bool>true</bool>
        </edit>
        <edit name="hinting" mode="assign">
            <bool>true</bool>
        </edit>
        <edit name="hintstyle" mode="assign">
            <const>hintslight</const>
        </edit>
        <edit name="rgba" mode="assign">
            <const>rgb</const>
        </edit>
    </match>
</fontconfig>
```

## 📱 Responsive Design

### DPI Scaling
```ini
# High DPI support
[Interface]
scale_factor=1.25
font_dpi=120

# Per-monitor scaling
export GDK_SCALE=1.25
export QT_SCALE_FACTOR=1.25
export QT_AUTO_SCREEN_SCALE_FACTOR=1
```

### Adaptive Layouts
```css
/* Responsive GTK styling */
@media (max-width: 768px) {
    .sidebar {
        min-width: 200px;
    }
    
    .headerbar {
        padding: 4px 8px;
    }
}

@media (min-width: 1200px) {
    .content-area {
        max-width: 1200px;
        margin: 0 auto;
    }
}
```

## 🔗 Integration Scripts

### Theme Application Script
```bash
#!/bin/bash
# apply-theme.sh

# Apply GTK themes
gsettings set org.gnome.desktop.interface gtk-theme "Adw-dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"

# Apply Qt themes
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum-dark

# Reload applications
pkill -SIGUSR1 waybar
pkill -SIGUSR1 dunst
```

### Color Extraction
```python
#!/usr/bin/env python3
# extract-colors.py
import colorsys
from PIL import Image
import sys

def extract_dominant_colors(image_path, num_colors=5):
    """Extract dominant colors from wallpaper"""
    image = Image.open(image_path)
    image = image.convert('RGB')
    image = image.resize((150, 150))
    
    colors = image.getcolors(maxcolors=256*256*256)
    colors = sorted(colors, key=lambda x: x[0], reverse=True)
    
    dominant_colors = []
    for count, color in colors[:num_colors]:
        dominant_colors.append(color)
    
    return dominant_colors

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: extract-colors.py <image_path>")
        sys.exit(1)
    
    colors = extract_dominant_colors(sys.argv[1])
    for i, color in enumerate(colors):
        print(f"Color {i+1}: #{color[0]:02x}{color[1]:02x}{color[2]:02x}")
```

## 🔗 Related Modules

- **[WM](../wm/README.md)**: Window manager theming and integration
- **[Terminal](../terminal/README.md)**: Terminal color schemes and fonts
- **[Tools](../tools/README.md)**: CLI tool theming and colors
- **[Media](../media/README.md)**: Wallpaper integration and color extraction