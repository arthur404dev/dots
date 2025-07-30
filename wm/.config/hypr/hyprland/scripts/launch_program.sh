#!/usr/bin/env bash

# Enhanced program launcher for Hyprland
# Usage: launch_program.sh <program_type> [additional_args...]
# Example: launch_program.sh terminal --additional-args

PROGRAM_TYPE="$1"
shift  # Remove program type from arguments, leaving additional args

# Configuration directory
PROGRAMS_DIR="$HOME/.config/hypr/programs"
FALLBACK_SCRIPT="$HOME/.config/hypr/hyprland/scripts/launch_first_available.sh"

# Function to log messages
log_message() {
    echo "[launch_program] $1" >&2
}

# Function to execute command with proper handling
execute_command() {
    local cmd="$1"
    local additional_args="$2"
    
    # If additional args provided, append them
    if [[ -n "$additional_args" ]]; then
        cmd="$cmd $additional_args"
    fi
    
    log_message "Executing: $cmd"
    eval "$cmd" &
}

# Main logic
if [[ -z "$PROGRAM_TYPE" ]]; then
    log_message "Error: No program type specified"
    log_message "Usage: launch_program.sh <program_type> [additional_args...]"
    exit 1
fi

PROGRAM_CONFIG="$PROGRAMS_DIR/$PROGRAM_TYPE"

# Check if program config file exists
if [[ -f "$PROGRAM_CONFIG" ]]; then
    # Read the preferred program from config file
    PREFERRED_PROGRAM=$(cat "$PROGRAM_CONFIG" | head -n1 | xargs)
    
    if [[ -n "$PREFERRED_PROGRAM" ]]; then
        # Check if the program exists (extract just the program name for checking)
        PROGRAM_NAME=$(echo "$PREFERRED_PROGRAM" | awk '{print $1}')
        
        # Handle tilde expansion for paths starting with ~
        if [[ "$PROGRAM_NAME" == ~* ]]; then
            PROGRAM_NAME="${PROGRAM_NAME/#\~/$HOME}"
        fi
        
        # Check if program exists
        if command -v "$PROGRAM_NAME" >/dev/null 2>&1 || [[ -x "$PROGRAM_NAME" ]]; then
            execute_command "$PREFERRED_PROGRAM" "$*"
            exit 0
        else
            log_message "Warning: Configured program '$PROGRAM_NAME' not found"
        fi
    else
        log_message "Warning: Empty configuration file: $PROGRAM_CONFIG"
    fi
else
    log_message "Warning: No configuration file found: $PROGRAM_CONFIG"
fi

# Fallback behavior based on program type
case "$PROGRAM_TYPE" in
    "terminal")
        log_message "Falling back to terminal alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "kitty -1" "foot" "alacritty" "wezterm" "konsole" "kgx" "uxterm" "xterm"
        fi
        ;;
    "terminal-zellij")
        log_message "Falling back to terminal with zellij alternatives"
        execute_command "kitty -e zsh -c \"zellij\"" "$*"
        exit 0
        ;;
    "file-manager")
        log_message "Falling back to file manager alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "nemo" "dolphin" "nautilus" "thunar" "kitty -1 fish -c yazi"
        fi
        ;;
    "browser")
        log_message "Falling back to browser alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "google-chrome-stable" "zen-browser" "firefox" "brave" "chromium" "microsoft-edge-stable" "opera" "librewolf"
        fi
        ;;
    "code-editor")
        log_message "Falling back to code editor alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "code" "codium" "cursor" "zed" "zedit" "zeditor" "kate" "gnome-text-editor" "emacs" "command -v nvim && kitty -1 nvim"
        fi
        ;;
    "text-editor")
        log_message "Falling back to text editor alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "kate" "gnome-text-editor" "emacs"
        fi
        ;;
    "office-suite")
        log_message "Falling back to office suite alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "wps" "onlyoffice-desktopeditors"
        fi
        ;;
    "volume-mixer")
        log_message "Falling back to volume mixer alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "pavucontrol-qt" "pavucontrol"
        fi
        ;;
    "settings-app")
        log_message "Falling back to settings app alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "systemsettings" "gnome-control-center" "better-control"
        fi
        ;;
    "task-manager")
        log_message "Falling back to task manager alternatives"
        if [[ -x "$FALLBACK_SCRIPT" ]]; then
            exec "$FALLBACK_SCRIPT" "gnome-system-monitor" "plasma-systemmonitor --page-name Processes" "command -v btop && kitty -1 fish -c btop"
        fi
        ;;
    "launcher")
        log_message "Falling back to launcher alternatives"
        execute_command "fuzzel" "$*"
        exit 0
        ;;
    "clipboard-manager")
        log_message "Falling back to clipboard manager alternatives"
        execute_command "cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy" "$*"
        exit 0
        ;;
    "screenshot-tool")
        log_message "Falling back to screenshot tool alternatives"
        execute_command "hyprshot --freeze --mode region" "$*"
        exit 0
        ;;
    "emoji-picker")
        log_message "Falling back to emoji picker alternatives"
        execute_command "~/.config/hypr/hyprland/scripts/fuzzel-emoji.sh copy" "$*"
        exit 0
        ;;
    *)
        log_message "Error: Unknown program type '$PROGRAM_TYPE'"
        log_message "Available types: terminal, terminal-zellij, file-manager, browser, code-editor, text-editor, office-suite, volume-mixer, settings-app, task-manager, launcher, clipboard-manager, screenshot-tool, emoji-picker"
        exit 1
        ;;
esac

log_message "Error: All fallback options failed for program type '$PROGRAM_TYPE'"
exit 1