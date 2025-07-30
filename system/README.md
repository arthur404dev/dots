# ⚙️ System Integration Configuration

System-wide integration configurations for desktop portals, application sandboxing, and seamless desktop environment experience.

## 📦 What's Included

### XDG Desktop Portal (`.config/xdg-desktop-portal/`)
Desktop integration for sandboxed applications:
- **`hyprland-portals.conf`**: Hyprland-specific portal configuration
  - File picker integration
  - Screen sharing and recording
  - Notification handling
  - Application launching

### XDG Desktop Portal KDE (`.config/`)
KDE-specific desktop portal configuration:
- **`xdg-desktop-portal-kderc`**: KDE portal settings
  - File dialog preferences
  - Integration with KDE services
  - Plasma-specific features

### GoXLR Utility (`.config/goxlr-utility/`)
Audio interface control and configuration:
- **`settings.json`**: GoXLR device settings and profiles
  - Mixer configurations
  - Audio routing settings
  - Button mappings and macros
  - Voice effects and processing

### LACT (`.config/lact/`)
Linux AMDGPU Control Tool for GPU management:
- **`ui.yaml`**: LACT interface configuration
  - GPU monitoring settings
  - Fan curve configurations
  - Power management profiles
  - Temperature and performance monitoring

### TuxClocker (`.config/`)
GPU overclocking and monitoring tool:
- **`tuxclocker.conf`**: TuxClocker configuration
  - GPU overclocking profiles
  - Fan control settings
  - Monitoring preferences
  - Safety limits and warnings

## 🚀 Key Features

### Desktop Portal Services
- **File Access**: Secure file picker for sandboxed applications
- **Screen Capture**: Screen sharing and recording capabilities
- **Notifications**: System notification integration
- **Application Launching**: Secure application launching from sandboxed apps
- **Device Access**: Camera, microphone, and device permissions
- **Location Services**: Location access for applications

### Wayland Integration
- **Native Wayland Support**: Optimized for Wayland compositors
- **Security**: Enhanced security through proper sandboxing
- **Performance**: Efficient communication between applications and system
- **Compatibility**: Fallback support for X11 applications

### Application Sandboxing
- **Flatpak Integration**: Seamless Flatpak application support
- **Snap Support**: Snap package integration
- **AppImage Compatibility**: AppImage application handling
- **Permission Management**: Fine-grained permission control

## 🔧 Configuration Details

### Hyprland Portal Configuration
```ini
# hyprland-portals.conf
[preferred]
default=hyprland;gtk
org.freedesktop.impl.portal.FileChooser=gtk
org.freedesktop.impl.portal.Secret=gnome-keyring
org.freedesktop.impl.portal.ScreenCast=hyprland
org.freedesktop.impl.portal.Screenshot=hyprland
org.freedesktop.impl.portal.Inhibit=hyprland
org.freedesktop.impl.portal.Notification=gtk
org.freedesktop.impl.portal.Print=gtk
org.freedesktop.impl.portal.Email=gtk
org.freedesktop.impl.portal.AppChooser=gtk

[hyprland]
# Hyprland-specific settings
exec_before=/usr/lib/xdg-desktop-portal-hyprland
chooser_type=default
chooser_cmd=rofi -dmenu -p "Choose application"
```

### KDE Portal Configuration
```ini
# xdg-desktop-portal-kderc
[org.freedesktop.impl.portal.FileChooser]
default=kde

[org.freedesktop.impl.portal.AppChooser]
default=kde

[org.freedesktop.impl.portal.Print]
default=kde

[org.freedesktop.impl.portal.Inhibit]
default=kde

[org.freedesktop.impl.portal.Notification]
default=kde

[FileChooser]
LastFolder[$e]=$HOME/Documents
```

## 🔄 Portal Management

### Portal Service Control
```bash
#!/bin/bash
# portal-control.sh

# Start desktop portals
start_portals() {
    echo "Starting desktop portals..."
    
    # Kill existing portals
    pkill -f xdg-desktop-portal
    
    # Start main portal
    /usr/lib/xdg-desktop-portal &
    
    # Start compositor-specific portal
    if pgrep -x "Hyprland" > /dev/null; then
        /usr/lib/xdg-desktop-portal-hyprland &
    elif pgrep -x "sway" > /dev/null; then
        /usr/lib/xdg-desktop-portal-wlr &
    fi
    
    # Start toolkit portals
    /usr/lib/xdg-desktop-portal-gtk &
    
    echo "Desktop portals started"
}

# Stop desktop portals
stop_portals() {
    echo "Stopping desktop portals..."
    pkill -f xdg-desktop-portal
    echo "Desktop portals stopped"
}

# Restart desktop portals
restart_portals() {
    stop_portals
    sleep 2
    start_portals
}

# Check portal status
check_portals() {
    echo "=== Desktop Portal Status ==="
    
    if pgrep -f "xdg-desktop-portal" > /dev/null; then
        echo "✓ Main portal: Running"
    else
        echo "✗ Main portal: Not running"
    fi
    
    if pgrep -f "xdg-desktop-portal-hyprland" > /dev/null; then
        echo "✓ Hyprland portal: Running"
    elif pgrep -f "xdg-desktop-portal-wlr" > /dev/null; then
        echo "✓ WLR portal: Running"
    else
        echo "✗ Compositor portal: Not running"
    fi
    
    if pgrep -f "xdg-desktop-portal-gtk" > /dev/null; then
        echo "✓ GTK portal: Running"
    else
        echo "✗ GTK portal: Not running"
    fi
    
    echo "=============================="
}

# Main execution
case "$1" in
    "start") start_portals ;;
    "stop") stop_portals ;;
    "restart") restart_portals ;;
    "status") check_portals ;;
    *) echo "Usage: $0 {start|stop|restart|status}" ;;
esac
```

### Portal Testing
```bash
#!/bin/bash
# test-portals.sh

# Test file picker
test_file_picker() {
    echo "Testing file picker portal..."
    if command -v zenity >/dev/null 2>&1; then
        zenity --file-selection --title="Portal File Picker Test"
        echo "File picker test completed"
    else
        echo "zenity not available for testing"
    fi
}

# Test screenshot portal
test_screenshot() {
    echo "Testing screenshot portal..."
    if command -v grim >/dev/null 2>&1; then
        grim -g "$(slurp)" /tmp/portal-test-screenshot.png
        echo "Screenshot saved to /tmp/portal-test-screenshot.png"
    else
        echo "grim/slurp not available for testing"
    fi
}

# Test notification portal
test_notification() {
    echo "Testing notification portal..."
    if command -v notify-send >/dev/null 2>&1; then
        notify-send "Portal Test" "Notification portal is working correctly"
        echo "Notification sent"
    else
        echo "notify-send not available for testing"
    fi
}

# Test screen sharing (requires additional setup)
test_screen_sharing() {
    echo "Testing screen sharing portal..."
    echo "Note: This requires a compatible application like OBS or browser"
    echo "Check if screen sharing works in your browser or recording software"
}

# Run all tests
run_all_tests() {
    echo "=== Portal Functionality Tests ==="
    test_file_picker
    echo
    test_screenshot
    echo
    test_notification
    echo
    test_screen_sharing
    echo "==================================="
}

# Main execution
case "$1" in
    "file") test_file_picker ;;
    "screenshot") test_screenshot ;;
    "notification") test_notification ;;
    "screen") test_screen_sharing ;;
    "all") run_all_tests ;;
    *) echo "Usage: $0 {file|screenshot|notification|screen|all}" ;;
esac
```

## 🔒 Security and Permissions

### Permission Management
```bash
#!/bin/bash
# permission-manager.sh

# Flatpak permission management
manage_flatpak_permissions() {
    local app="$1"
    local permission="$2"
    local action="$3"
    
    case "$action" in
        "grant")
            flatpak permission-set desktop-used-apps "$app" "$permission" yes
            echo "Granted $permission to $app"
            ;;
        "revoke")
            flatpak permission-set desktop-used-apps "$app" "$permission" no
            echo "Revoked $permission from $app"
            ;;
        "list")
            flatpak permissions "$app"
            ;;
    esac
}

# Portal permission audit
audit_portal_permissions() {
    echo "=== Portal Permission Audit ==="
    
    # Check file access permissions
    echo "File Access Permissions:"
    find ~/.local/share/flatpak/app -name "*.desktop" -exec basename {} .desktop \; | \
        while read app; do
            echo "  $app: $(flatpak info --show-permissions "$app" 2>/dev/null | grep filesystem || echo 'No file access')"
        done
    
    # Check device permissions
    echo -e "\nDevice Access Permissions:"
    flatpak list --app --columns=application,permissions | grep -E "(camera|microphone|device)"
    
    echo "==============================="
}

# Security recommendations
security_recommendations() {
    echo "=== Security Recommendations ==="
    echo "1. Regularly audit application permissions"
    echo "2. Revoke unnecessary file system access"
    echo "3. Monitor portal logs for suspicious activity"
    echo "4. Keep portal implementations updated"
    echo "5. Use application-specific permission profiles"
    echo "================================="
}

# Main execution
case "$1" in
    "flatpak") manage_flatpak_permissions "$2" "$3" "$4" ;;
    "audit") audit_portal_permissions ;;
    "security") security_recommendations ;;
    *) echo "Usage: $0 {flatpak <app> <permission> <grant|revoke|list>|audit|security}" ;;
esac
```

### Portal Logging and Monitoring
```bash
#!/bin/bash
# portal-monitor.sh

# Monitor portal activity
monitor_portals() {
    echo "Monitoring desktop portal activity..."
    echo "Press Ctrl+C to stop"
    
    # Monitor portal logs
    journalctl -f -u xdg-desktop-portal.service -u xdg-desktop-portal-hyprland.service --no-hostname
}

# Analyze portal usage
analyze_portal_usage() {
    local days="${1:-7}"
    
    echo "=== Portal Usage Analysis (Last $days days) ==="
    
    # File picker usage
    echo "File Picker Usage:"
    journalctl --since="$days days ago" -u xdg-desktop-portal.service | \
        grep -c "FileChooser" || echo "0 uses"
    
    # Screenshot usage
    echo "Screenshot Usage:"
    journalctl --since="$days days ago" -u xdg-desktop-portal-hyprland.service | \
        grep -c "Screenshot" || echo "0 uses"
    
    # Screen sharing usage
    echo "Screen Sharing Usage:"
    journalctl --since="$days days ago" -u xdg-desktop-portal-hyprland.service | \
        grep -c "ScreenCast" || echo "0 uses"
    
    echo "=============================================="
}

# Portal error detection
detect_portal_errors() {
    echo "=== Portal Error Detection ==="
    
    # Check for common errors
    local errors=$(journalctl --since="1 day ago" -u xdg-desktop-portal.service -p err --no-pager -q)
    
    if [[ -n "$errors" ]]; then
        echo "Recent portal errors found:"
        echo "$errors"
    else
        echo "No recent portal errors detected"
    fi
    
    echo "=============================="
}

# Main execution
case "$1" in
    "monitor") monitor_portals ;;
    "analyze") analyze_portal_usage "$2" ;;
    "errors") detect_portal_errors ;;
    *) echo "Usage: $0 {monitor|analyze [days]|errors}" ;;
esac
```

## 🔧 Troubleshooting

### Common Issues and Solutions
```bash
#!/bin/bash
# portal-troubleshoot.sh

# Fix common portal issues
fix_portal_issues() {
    echo "=== Portal Troubleshooting ==="
    
    # Issue 1: Portals not starting
    echo "1. Checking portal services..."
    if ! pgrep -f xdg-desktop-portal > /dev/null; then
        echo "   Starting missing portals..."
        systemctl --user restart xdg-desktop-portal.service
    else
        echo "   ✓ Portals are running"
    fi
    
    # Issue 2: File picker not working
    echo "2. Checking file picker configuration..."
    if [[ ! -f ~/.config/xdg-desktop-portal/hyprland-portals.conf ]]; then
        echo "   ⚠ Portal configuration missing"
        echo "   Creating default configuration..."
        mkdir -p ~/.config/xdg-desktop-portal
        cat > ~/.config/xdg-desktop-portal/hyprland-portals.conf << 'EOF'
[preferred]
default=hyprland;gtk
org.freedesktop.impl.portal.FileChooser=gtk
EOF
    else
        echo "   ✓ Portal configuration exists"
    fi
    
    # Issue 3: Screen sharing not working
    echo "3. Checking screen sharing setup..."
    if ! pgrep -f xdg-desktop-portal-hyprland > /dev/null; then
        echo "   ⚠ Hyprland portal not running"
        echo "   Starting Hyprland portal..."
        /usr/lib/xdg-desktop-portal-hyprland &
    else
        echo "   ✓ Hyprland portal is running"
    fi
    
    # Issue 4: Permission problems
    echo "4. Checking permissions..."
    local portal_dir="$XDG_RUNTIME_DIR/xdg-desktop-portal"
    if [[ ! -d "$portal_dir" ]]; then
        echo "   ⚠ Portal runtime directory missing"
        mkdir -p "$portal_dir"
    else
        echo "   ✓ Portal runtime directory exists"
    fi
    
    echo "==============================="
}

# Reset portal configuration
reset_portal_config() {
    echo "Resetting portal configuration..."
    
    # Backup existing config
    if [[ -d ~/.config/xdg-desktop-portal ]]; then
        mv ~/.config/xdg-desktop-portal ~/.config/xdg-desktop-portal.backup.$(date +%s)
    fi
    
    # Stop portals
    pkill -f xdg-desktop-portal
    
    # Clear runtime data
    rm -rf "$XDG_RUNTIME_DIR/xdg-desktop-portal"
    
    # Restart portals
    sleep 2
    /usr/lib/xdg-desktop-portal &
    
    echo "Portal configuration reset complete"
}

# Diagnostic information
collect_diagnostics() {
    echo "=== Portal Diagnostics ==="
    
    echo "Environment:"
    echo "  XDG_CURRENT_DESKTOP: $XDG_CURRENT_DESKTOP"
    echo "  XDG_SESSION_TYPE: $XDG_SESSION_TYPE"
    echo "  WAYLAND_DISPLAY: $WAYLAND_DISPLAY"
    
    echo -e "\nRunning Portals:"
    pgrep -f xdg-desktop-portal | while read pid; do
        echo "  $(ps -p $pid -o comm= -o args=)"
    done
    
    echo -e "\nPortal Configuration:"
    if [[ -f ~/.config/xdg-desktop-portal/hyprland-portals.conf ]]; then
        echo "  Configuration file exists"
        echo "  Default portal: $(grep '^default=' ~/.config/xdg-desktop-portal/hyprland-portals.conf | cut -d'=' -f2)"
    else
        echo "  No configuration file found"
    fi
    
    echo -e "\nRecent Portal Logs:"
    journalctl --since="1 hour ago" -u xdg-desktop-portal.service --no-pager -n 5
    
    echo "=========================="
}

# Main execution
case "$1" in
    "fix") fix_portal_issues ;;
    "reset") reset_portal_config ;;
    "diagnostics") collect_diagnostics ;;
    *) echo "Usage: $0 {fix|reset|diagnostics}" ;;
esac
```

## 🔄 Integration Scripts

### Startup Integration
```bash
#!/bin/bash
# portal-startup.sh

# Ensure portals start with the desktop session
setup_portal_autostart() {
    local autostart_dir="$HOME/.config/autostart"
    mkdir -p "$autostart_dir"
    
    # Create autostart entry for portals
    cat > "$autostart_dir/xdg-desktop-portal.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=XDG Desktop Portal
Exec=/usr/lib/xdg-desktop-portal
NoDisplay=true
X-GNOME-Autostart-Phase=Initialization
X-GNOME-AutoRestart=true
X-KDE-autostart-phase=1
EOF
    
    echo "Portal autostart configured"
}

# Remove autostart
remove_portal_autostart() {
    rm -f "$HOME/.config/autostart/xdg-desktop-portal.desktop"
    echo "Portal autostart removed"
}

# Main execution
case "$1" in
    "setup") setup_portal_autostart ;;
    "remove") remove_portal_autostart ;;
    *) echo "Usage: $0 {setup|remove}" ;;
esac
```

## 🔗 Related Modules

- **[WM](../wm/README.md)**: Window manager integration with desktop portals
- **[Apps](../apps/README.md)**: Application sandboxing and portal usage
- **[Theme](../theme/README.md)**: System-wide theming through portals
- **[Security](../security/README.md)**: Security considerations for system integration