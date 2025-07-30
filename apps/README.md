# 📱 Application Configuration

Performance and feature flags for browsers and applications, optimized for better performance, security, and user experience.

## 📦 What's Included

### Browser Flags (`.config/`)
Performance and feature optimization flags:
- **`chrome-flags.conf`**: Google Chrome optimization flags
- **`code-flags.conf`**: Visual Studio Code performance flags  
- **`thorium-flags.conf`**: Thorium browser optimization flags

## 🚀 Key Features

### Performance Optimization
- **GPU Acceleration**: Hardware-accelerated rendering and compositing
- **Memory Management**: Improved memory usage and garbage collection
- **Network Optimization**: Faster loading and reduced bandwidth usage
- **CPU Efficiency**: Reduced CPU usage and better power management

### Security Enhancements
- **Sandboxing**: Enhanced process isolation and security
- **Privacy Controls**: Improved tracking protection and data handling
- **Secure Connections**: Enforced HTTPS and secure protocols
- **Content Filtering**: Protection against malicious content

### User Experience
- **Smooth Scrolling**: Enhanced scrolling performance
- **Touch Support**: Improved touch and gesture handling
- **High DPI**: Better scaling on high-resolution displays
- **Accessibility**: Enhanced accessibility features

## 🔧 Configuration Details

### Chrome Flags (`chrome-flags.conf`)
```bash
# Performance optimizations
--enable-gpu-rasterization
--enable-zero-copy
--enable-hardware-overlays
--enable-features=VaapiVideoDecoder,VaapiVideoEncoder
--disable-features=UseChromeOSDirectVideoDecoder

# Memory and CPU optimizations
--memory-pressure-off
--max_old_space_size=4096
--aggressive-cache-discard
--enable-parallel-downloading

# Graphics and rendering
--enable-gpu-compositing
--enable-accelerated-2d-canvas
--enable-accelerated-video-decode
--ignore-gpu-blacklist
--disable-gpu-sandbox

# Network optimizations
--enable-quic
--enable-tcp-fast-open
--enable-experimental-web-platform-features

# Privacy and security
--enable-strict-mixed-content-checking
--enable-features=SecurePaymentConfirmation
--disable-background-networking
--disable-default-apps
--disable-extensions-http-throttling

# UI improvements
--enable-smooth-scrolling
--enable-overlay-scrollbars
--enable-features=OverlayScrollbar
--force-device-scale-factor=1
```

### VSCode Flags (`code-flags.conf`)
```bash
# Performance optimizations
--enable-gpu-rasterization
--enable-zero-copy
--disable-gpu-sandbox
--enable-native-gpu-memory-buffers

# Memory management
--memory-pressure-off
--max-old-space-size=8192
--js-flags="--max-old-space-size=8192"

# Rendering improvements
--enable-accelerated-2d-canvas
--enable-gpu-compositing
--enable-hardware-overlays
--disable-software-rasterizer

# File system optimizations
--enable-features=FileSystemAccessAPI
--disable-features=CalculateNativeWinOcclusion

# Development features
--enable-proposed-api
--enable-crash-reporter
--enable-logging=stderr
--log-level=0

# UI enhancements
--enable-smooth-scrolling
--enable-overlay-scrollbars
--force-device-scale-factor=1
--high-dpi-support=1

# Security
--enable-strict-mixed-content-checking
--disable-background-networking
--disable-default-apps
```

### Thorium Flags (`thorium-flags.conf`)
```bash
# Thorium-specific optimizations
--enable-features=ThoriumUI,ThoriumJIT
--enable-thorium-optimizations
--enable-avx2-optimizations

# Performance flags
--enable-gpu-rasterization
--enable-zero-copy
--enable-hardware-overlays
--enable-parallel-downloading
--enable-quic

# Memory optimizations
--memory-pressure-off
--aggressive-cache-discard
--enable-features=MemoryAblation

# Graphics acceleration
--enable-gpu-compositing
--enable-accelerated-2d-canvas
--enable-accelerated-video-decode
--ignore-gpu-blacklist

# Network improvements
--enable-tcp-fast-open
--enable-experimental-web-platform-features
--enable-features=NetworkService

# Privacy enhancements
--enable-strict-mixed-content-checking
--disable-background-networking
--enable-features=PrivacySandboxSettings3

# UI optimizations
--enable-smooth-scrolling
--enable-overlay-scrollbars
--force-device-scale-factor=1
--enable-features=WebUIDarkMode
```

## 🎯 Application-Specific Optimizations

### Chrome/Chromium Optimization
```bash
# Launch script with optimized flags
#!/bin/bash
# chrome-optimized.sh

# Set environment variables
export CHROME_FLAGS="$(cat ~/.config/chrome-flags.conf | tr '\n' ' ')"

# Hardware acceleration check
if lspci | grep -i nvidia > /dev/null; then
    export CHROME_FLAGS="$CHROME_FLAGS --enable-features=VaapiVideoDecoder"
fi

# Launch Chrome with optimized flags
google-chrome $CHROME_FLAGS "$@"
```

### VSCode Performance Tuning
```bash
# Launch script for VSCode
#!/bin/bash
# code-optimized.sh

# Set Node.js memory limit
export NODE_OPTIONS="--max-old-space-size=8192"

# Load flags from config
export CODE_FLAGS="$(cat ~/.config/code-flags.conf | tr '\n' ' ')"

# Launch VSCode with optimizations
code $CODE_FLAGS "$@"
```

### Thorium Browser Setup
```bash
# Thorium launch script
#!/bin/bash
# thorium-optimized.sh

# CPU-specific optimizations
if grep -q avx2 /proc/cpuinfo; then
    export THORIUM_FLAGS="--enable-avx2-optimizations"
fi

# Load configuration flags
export THORIUM_FLAGS="$THORIUM_FLAGS $(cat ~/.config/thorium-flags.conf | tr '\n' ' ')"

# Launch Thorium
thorium-browser $THORIUM_FLAGS "$@"
```

## 🔄 Desktop Integration

### Desktop Entry Modifications
```ini
# ~/.local/share/applications/chrome-optimized.desktop
[Desktop Entry]
Version=1.0
Name=Chrome (Optimized)
GenericName=Web Browser
Comment=Access the Internet with optimized performance
Exec=/home/user/scripts/chrome-optimized.sh %U
StartupNotify=true
Terminal=false
Icon=google-chrome
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Exec=/home/user/scripts/chrome-optimized.sh --new-window

[Desktop Action new-private-window]
Name=New Private Window
Exec=/home/user/scripts/chrome-optimized.sh --incognito
```

### System Service Integration
```ini
# ~/.config/systemd/user/chrome-preload.service
[Unit]
Description=Chrome Preload Service
After=graphical-session.target

[Service]
Type=forking
ExecStart=/home/user/scripts/chrome-optimized.sh --no-startup-window --disable-background-mode
Restart=no

[Install]
WantedBy=default.target
```

## 📊 Performance Monitoring

### Browser Performance Scripts
```bash
#!/bin/bash
# browser-performance.sh

# Chrome memory usage
chrome_memory() {
    ps aux | grep chrome | awk '{sum+=$6} END {print "Chrome Memory:", sum/1024 "MB"}'
}

# VSCode resource usage
vscode_resources() {
    ps aux | grep code | awk '{cpu+=$3; mem+=$6} END {print "VSCode CPU:", cpu "%, Memory:", mem/1024 "MB"}'
}

# GPU usage monitoring
gpu_usage() {
    if command -v nvidia-smi >/dev/null 2>&1; then
        nvidia-smi --query-gpu=utilization.gpu,memory.used --format=csv,noheader,nounits
    elif command -v radeontop >/dev/null 2>&1; then
        radeontop -d - -l 1 | grep -o 'gpu [0-9]*%'
    fi
}

# Network usage by browser
network_usage() {
    ss -tuln | grep -E ':80|:443' | wc -l
    echo "Active connections"
}

# Main monitoring function
monitor_performance() {
    echo "=== Browser Performance Monitor ==="
    echo "$(date)"
    echo
    chrome_memory
    vscode_resources
    echo "GPU Usage: $(gpu_usage)"
    echo "Network Connections: $(network_usage)"
    echo "=================================="
}

# Run monitoring
case "$1" in
    "monitor") monitor_performance ;;
    "chrome") chrome_memory ;;
    "vscode") vscode_resources ;;
    "gpu") gpu_usage ;;
    *) echo "Usage: $0 {monitor|chrome|vscode|gpu}" ;;
esac
```

### Automated Optimization
```bash
#!/bin/bash
# auto-optimize.sh

# Detect system capabilities
detect_capabilities() {
    local caps=""
    
    # Check for hardware acceleration
    if lspci | grep -i nvidia > /dev/null; then
        caps="$caps nvidia"
    fi
    
    if lspci | grep -i amd > /dev/null; then
        caps="$caps amd"
    fi
    
    # Check CPU features
    if grep -q avx2 /proc/cpuinfo; then
        caps="$caps avx2"
    fi
    
    # Check memory
    local mem_gb=$(free -g | awk '/^Mem:/{print $2}')
    if [[ $mem_gb -gt 16 ]]; then
        caps="$caps highmem"
    fi
    
    echo "$caps"
}

# Generate optimized flags
generate_flags() {
    local app="$1"
    local caps="$(detect_capabilities)"
    local flags=""
    
    case "$app" in
        "chrome")
            flags="--enable-gpu-rasterization --enable-zero-copy"
            [[ "$caps" =~ nvidia ]] && flags="$flags --enable-features=VaapiVideoDecoder"
            [[ "$caps" =~ highmem ]] && flags="$flags --memory-pressure-off"
            ;;
        "vscode")
            flags="--enable-gpu-rasterization --disable-gpu-sandbox"
            [[ "$caps" =~ highmem ]] && flags="$flags --max-old-space-size=8192"
            ;;
        "thorium")
            flags="--enable-thorium-optimizations"
            [[ "$caps" =~ avx2 ]] && flags="$flags --enable-avx2-optimizations"
            ;;
    esac
    
    echo "$flags"
}

# Apply optimizations
apply_optimizations() {
    local app="$1"
    local flags="$(generate_flags "$app")"
    
    echo "$flags" > ~/.config/${app}-flags.conf
    echo "Optimized flags for $app: $flags"
}

# Main execution
if [[ $# -eq 0 ]]; then
    echo "Auto-optimizing all applications..."
    apply_optimizations "chrome"
    apply_optimizations "vscode"
    apply_optimizations "thorium"
else
    apply_optimizations "$1"
fi
```

## 🔒 Security Considerations

### Secure Flag Management
```bash
# Security-focused flags
SECURITY_FLAGS=(
    "--enable-strict-mixed-content-checking"
    "--disable-background-networking"
    "--disable-default-apps"
    "--enable-features=SecurePaymentConfirmation"
    "--disable-extensions-http-throttling"
)

# Privacy-focused flags
PRIVACY_FLAGS=(
    "--disable-background-timer-throttling"
    "--disable-backgrounding-occluded-windows"
    "--disable-renderer-backgrounding"
    "--disable-features=TranslateUI"
    "--disable-ipc-flooding-protection"
)

# Apply security flags
apply_security_flags() {
    local app="$1"
    local config_file="~/.config/${app}-flags.conf"
    
    # Backup existing config
    cp "$config_file" "${config_file}.backup"
    
    # Add security flags
    for flag in "${SECURITY_FLAGS[@]}"; do
        echo "$flag" >> "$config_file"
    done
    
    echo "Security flags applied to $app"
}
```

### Flag Validation
```bash
#!/bin/bash
# validate-flags.sh

# Known problematic flags
PROBLEMATIC_FLAGS=(
    "--disable-web-security"
    "--allow-running-insecure-content"
    "--disable-features=VizDisplayCompositor"
    "--no-sandbox"
)

# Validate flag safety
validate_flags() {
    local config_file="$1"
    local issues=0
    
    echo "Validating flags in $config_file..."
    
    for flag in "${PROBLEMATIC_FLAGS[@]}"; do
        if grep -q "$flag" "$config_file"; then
            echo "WARNING: Potentially unsafe flag found: $flag"
            ((issues++))
        fi
    done
    
    if [[ $issues -eq 0 ]]; then
        echo "✓ All flags appear safe"
    else
        echo "⚠ Found $issues potentially problematic flags"
    fi
    
    return $issues
}

# Validate all flag files
for config in ~/.config/*-flags.conf; do
    validate_flags "$config"
    echo
done
```

## 🔗 Related Modules

- **[System](../system/README.md)**: System-wide application integration
- **[Theme](../theme/README.md)**: Application theming and appearance
- **[WM](../wm/README.md)**: Window manager integration with applications
- **[Tools](../tools/README.md)**: Development tools and application optimization