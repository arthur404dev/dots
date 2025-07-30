# Configurable Program Selection System - Implementation Plan

## Context

### Current State
The Hyprland configuration currently uses hardcoded program lists in keybinds through the `launch_first_available.sh` script. This approach has several limitations:

1. **Hardcoded Dependencies**: Program preferences are embedded directly in keybind definitions
2. **No Centralized Management**: Each keybind must be manually updated to change program preferences
3. **Limited Flexibility**: No easy way to switch between different program sets or configurations
4. **Future Dashboard Limitations**: Current structure doesn't support programmatic management for future dashboard implementation

### Identified Hardcoded Programs
From analysis of `wm/.config/hypr/hyprland/keybinds.conf`:

- **Terminal** (lines 204-206): `kitty -1`, `foot`, `alacritty`, `wezterm`, `konsole`, `kgx`, `uxterm`, `xterm`
- **File Manager** (line 207): `nemo`, `dolphin`, `nautilus`, `thunar`, `kitty -1 fish -c yazi`
- **Browser** (line 208): `google-chrome-stable`, `zen-browser`, `firefox`, `brave`, `chromium`, `microsoft-edge-stable`, `opera`, `librewolf`
- **Code Editor** (line 209): `code`, `codium`, `cursor`, `zed`, `zedit`, `zeditor`, `kate`, `gnome-text-editor`, `emacs`, `command -v nvim && kitty -1 nvim`
- **Office Software** (line 210): `wps`, `onlyoffice-desktopeditors`
- **Text Editor** (line 211): `kate`, `gnome-text-editor`, `emacs`
- **Volume Mixer** (line 212): `pavucontrol-qt`, `pavucontrol`
- **Settings App** (line 213): `qs -p ~/.config/quickshell/$qsConfig/settings.qml`, `systemsettings`, `gnome-control-center`, `better-control`
- **Task Manager** (line 214): `gnome-system-monitor`, `plasma-systemmonitor --page-name Processes`, `command -v btop && kitty -1 fish -c btop`

### Additional Hardcoded Programs
From other configuration files:
- **Launcher fallbacks** (line 8): `fuzzel`
- **Clipboard manager** (line 52): `cliphist`, `fuzzel`
- **Screenshot tools** (line 54): `hyprshot`
- **Emoji picker** (line 53): `fuzzel-emoji.sh`

## Specification

### Architecture Overview
```
wm/.config/hypr/
├── programs/                    # New: Program configuration directory
│   ├── terminal                 # Contains preferred terminal command
│   ├── file-manager            # Contains preferred file manager command
│   ├── browser                 # Contains preferred browser command
│   ├── code-editor             # Contains preferred code editor command
│   ├── text-editor             # Contains preferred text editor command
│   ├── office-suite            # Contains preferred office suite command
│   ├── volume-mixer            # Contains preferred volume mixer command
│   ├── settings-app            # Contains preferred settings app command
│   ├── task-manager            # Contains preferred task manager command
│   ├── launcher                # Contains preferred launcher command
│   ├── clipboard-manager       # Contains preferred clipboard manager command
│   ├── screenshot-tool         # Contains preferred screenshot tool command
│   └── emoji-picker            # Contains preferred emoji picker command
├── hyprland/scripts/
│   ├── launch_first_available.sh  # Existing script (to be deprecated)
│   └── launch_program.sh          # New: Enhanced program launcher
└── hyprland/keybinds.conf         # Modified to use new system
```

### Program Configuration Schema
Each program configuration file will contain a single line with the preferred command:

**Format Options:**
1. **Program name only**: `kitty` (relies on PATH resolution)
2. **Full path**: `/usr/bin/kitty` (absolute path to binary)
3. **Command with arguments**: `kitty -1` (program with default arguments)
4. **Complex command**: `kitty -e zsh -c "zellij"` (complex launch command)

**Example Files:**
- `programs/terminal`: `kitty -1`
- `programs/browser`: `google-chrome-stable`
- `programs/file-manager`: `nemo`

### Enhanced Launcher Script
New `launch_program.sh` script will:
1. Accept a program type as first argument (e.g., "terminal", "browser")
2. Read the preferred program from the corresponding config file
3. Fall back to `launch_first_available.sh` behavior if config file doesn't exist
4. Support both simple program names and complex commands
5. Provide error handling and logging

**Script Interface:**
```bash
# Launch preferred program
launch_program.sh terminal

# Launch with additional arguments
launch_program.sh terminal --additional-args

# Launch with fallback list (backward compatibility)
launch_program.sh terminal "kitty -1" "foot" "alacritty"
```

### Keybind Integration
Keybinds will be updated to use the new system:

**Before:**
```
bind = Super, Return, exec, ~/.config/hypr/hyprland/scripts/launch_first_available.sh "kitty -1" "foot" "alacritty" "wezterm" "konsole" "kgx" "uxterm" "xterm"
```

**After:**
```
bind = Super, Return, exec, ~/.config/hypr/hyprland/scripts/launch_program.sh terminal
```

### Special Cases Handling
1. **Terminal with Zellij**: Create separate config `programs/terminal-zellij`
2. **Environment Variables**: Support for commands requiring specific env vars
3. **Conditional Commands**: Handle complex commands like `command -v nvim && kitty -1 nvim`

## Implementation

### Phase 1: Infrastructure Setup
1. **Create program configuration directory**
   - Location: `wm/.config/hypr/programs/`
   - Add to `.stowrc` ignore patterns: `--ignore=docs`

2. **Create initial program configuration files**
   - `programs/terminal` → `kitty -1`
   - `programs/file-manager` → `nemo`
   - `programs/browser` → `google-chrome-stable`
   - `programs/code-editor` → `code`
   - `programs/text-editor` → `kate`
   - `programs/office-suite` → `wps`
   - `programs/volume-mixer` → `pavucontrol-qt`
   - `programs/settings-app` → `systemsettings`
   - `programs/task-manager` → `gnome-system-monitor`
   - `programs/launcher` → `fuzzel`
   - `programs/clipboard-manager` → `cliphist`
   - `programs/screenshot-tool` → `hyprshot`
   - `programs/emoji-picker` → `~/.config/hypr/hyprland/scripts/fuzzel-emoji.sh`

3. **Create enhanced launcher script**
   - File: `wm/.config/hypr/hyprland/scripts/launch_program.sh`
   - Features:
     - Read program preference from config file
     - Fallback to launch_first_available.sh behavior
     - Support for complex commands
     - Error handling and logging
     - Backward compatibility

### Phase 2: Keybind Migration
1. **Update main application keybinds** (`wm/.config/hypr/hyprland/keybinds.conf`)
   - Line 204: Terminal keybind
   - Line 205-206: Alternative terminal keybinds
   - Line 207: File manager keybind
   - Line 208: Browser keybind
   - Line 209: Code editor keybind
   - Line 210: Office software keybind
   - Line 211: Text editor keybind
   - Line 212: Volume mixer keybind
   - Line 213: Settings app keybind
   - Line 214: Task manager keybind

2. **Update utility keybinds**
   - Line 8: Launcher fallback
   - Line 52: Clipboard manager fallback
   - Line 53: Emoji picker fallback
   - Line 54: Screenshot tool

3. **Handle special cases**
   - Create `programs/terminal-zellij` for zellij integration
   - Update custom keybinds in `wm/.config/hypr/custom/keybinds.conf`

### Phase 3: Testing and Validation
1. **Test each program type**
   - Verify program launches correctly
   - Test fallback behavior
   - Validate complex commands

2. **Test keybind functionality**
   - Verify all keybinds work as expected
   - Test both primary and fallback scenarios

3. **Backward compatibility testing**
   - Ensure existing functionality is preserved
   - Test with missing config files

### Phase 4: Documentation and Cleanup
1. **Update documentation**
   - Document new program configuration system
   - Provide examples for different program types
   - Document migration process

2. **Clean up deprecated code**
   - Mark `launch_first_available.sh` as deprecated
   - Add migration notices

### Detailed File Changes

#### New Files to Create:
1. `wm/.config/hypr/programs/terminal`
2. `wm/.config/hypr/programs/file-manager`
3. `wm/.config/hypr/programs/browser`
4. `wm/.config/hypr/programs/code-editor`
5. `wm/.config/hypr/programs/text-editor`
6. `wm/.config/hypr/programs/office-suite`
7. `wm/.config/hypr/programs/volume-mixer`
8. `wm/.config/hypr/programs/settings-app`
9. `wm/.config/hypr/programs/task-manager`
10. `wm/.config/hypr/programs/launcher`
11. `wm/.config/hypr/programs/clipboard-manager`
12. `wm/.config/hypr/programs/screenshot-tool`
13. `wm/.config/hypr/programs/emoji-picker`
14. `wm/.config/hypr/programs/terminal-zellij`
15. `wm/.config/hypr/hyprland/scripts/launch_program.sh`

#### Files to Modify:
1. `wm/.config/hypr/hyprland/keybinds.conf` (lines 8, 52-54, 204-214)
2. `wm/.config/hypr/custom/keybinds.conf` (terminal keybinds)
3. `.stowrc` (add docs ignore pattern)

#### Script Implementation Details:
`launch_program.sh` should:
- Accept program type as first argument
- Read from `~/.config/hypr/programs/$1` file
- Execute the command from the file
- Fall back to launch_first_available.sh if file doesn't exist
- Handle complex commands with proper shell escaping
- Provide meaningful error messages
- Support additional arguments passed through

### Future Extensibility
This system is designed to support:
1. **Dashboard Integration**: Easy programmatic reading/writing of program preferences
2. **Profile Management**: Different program sets for different use cases
3. **Advanced Configuration**: Support for program-specific arguments and environment variables
4. **Validation**: Checking if configured programs are actually installed
5. **Auto-detection**: Automatically detecting and suggesting available programs

### Benefits
1. **Centralized Management**: All program preferences in one location
2. **Easy Switching**: Change programs by editing a single file
3. **Dashboard Ready**: Structure supports future GUI management
4. **Backward Compatible**: Existing functionality preserved during transition
5. **Scalable**: Easy to add new program types and configurations
6. **Maintainable**: Clear separation of concerns between keybinds and program selection