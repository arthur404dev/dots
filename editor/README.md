# ✏️ Editor Configuration

Modern text editor configurations optimized for development workflows, featuring LSP integration, syntax highlighting, and productivity enhancements.

## 📦 What's Included

### Neovim (`.config/nvim/`)
Modern Vim distribution with extensive plugin ecosystem:
- **`init.lua`**: Main configuration entry point
- **`lua/config/`**: Core configuration modules
  - Keymaps, options, and autocmds
  - Plugin management setup
- **`lazy-lock.json`**: Plugin version lockfile for reproducible setups
- **`lazyvim.json`**: LazyVim configuration and feature toggles
- **`.neoconf.json`**: Project-specific LSP and tool configurations
- **`stylua.toml`**: Lua code formatting configuration

### Micro (`.config/micro/`)
Simple, intuitive terminal-based text editor:
- **`settings.json`**: Editor preferences and behavior
- **`bindings.json`**: Custom key bindings and shortcuts
- **`colorschemes/`**: Custom color schemes
  - `meowrch.micro`: Custom colorscheme matching system theme

## 🚀 Key Features

### Neovim Features
- **LSP Integration**: Language Server Protocol for intelligent code completion
- **Treesitter**: Advanced syntax highlighting and code understanding
- **Plugin Management**: Lazy.nvim for efficient plugin loading
- **Git Integration**: Fugitive, Gitsigns for version control
- **File Explorer**: Neo-tree or nvim-tree for project navigation
- **Fuzzy Finding**: Telescope for files, buffers, and text search
- **Terminal Integration**: Built-in terminal and tmux/zellij integration
- **Code Formatting**: Automatic formatting with conform.nvim
- **Debugging**: DAP (Debug Adapter Protocol) support

### Micro Features
- **Syntax Highlighting**: Support for 100+ languages
- **Multiple Cursors**: Edit multiple locations simultaneously
- **Plugin System**: Extensible with Lua plugins
- **Mouse Support**: Full mouse integration in terminal
- **Split Panes**: Horizontal and vertical splits
- **Clipboard Integration**: System clipboard support

## ⌨️ Key Bindings

### Neovim (LazyVim) Shortcuts
```vim
" Leader key: Space

" File operations
<leader>ff          " Find files (Telescope)
<leader>fg          " Live grep (Telescope)
<leader>fb          " Find buffers
<leader>fr          " Recent files

" Code navigation
gd                  " Go to definition
gr                  " Go to references
K                   " Hover documentation
<leader>ca          " Code actions
<leader>rn          " Rename symbol

" Window management
<C-h/j/k/l>         " Navigate windows
<leader>w           " Window commands
<leader>-           " Split horizontally
<leader>|           " Split vertically

" Git integration
<leader>gg          " Lazygit
<leader>gb          " Git blame
<leader>gd          " Git diff
]c / [c             " Next/previous git hunk

" LSP diagnostics
]d / [d             " Next/previous diagnostic
<leader>cd          " Line diagnostics
<leader>cD          " Workspace diagnostics

" Terminal
<C-/>               " Toggle terminal
<leader>ft          " Terminal (root dir)
<leader>fT          " Terminal (cwd)
```

### Micro Shortcuts
```bash
# File operations
Ctrl+S              # Save
Ctrl+O              # Open
Ctrl+Q              # Quit
Ctrl+W              # Close tab

# Editing
Ctrl+Z              # Undo
Ctrl+Y              # Redo
Ctrl+C              # Copy
Ctrl+V              # Paste
Ctrl+X              # Cut

# Navigation
Ctrl+F              # Find
Ctrl+R              # Find and replace
Ctrl+G              # Go to line
Ctrl+A              # Select all

# Multiple cursors
Alt+Shift+Up/Down   # Add cursor above/below
Alt+Shift+Left/Right # Select word
Ctrl+D              # Select next occurrence

# Panes
Ctrl+E              # Command mode
> split right       # Split vertically
> split down        # Split horizontally
> quit              # Close pane
```

## 🔧 Customization

### Neovim Configuration

**Adding New Plugins:**
Create a new file in `lua/plugins/`:
```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({
      -- plugin configuration
    })
  end,
  keys = {
    { "<leader>mp", "<cmd>PluginCommand<cr>", desc = "My Plugin" },
  },
}
```

**Custom Keymaps:**
Edit `lua/config/keymaps.lua`:
```lua
local map = vim.keymap.set

-- Custom mappings
map("n", "<leader>mp", "<cmd>MyCommand<cr>", { desc = "My custom command" })
map("v", "<leader>ms", ":sort<cr>", { desc = "Sort selection" })
```

**LSP Configuration:**
```lua
-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Add new language servers
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
          },
        },
      },
    },
  },
}
```

### Micro Configuration

**Custom Settings:**
Edit `settings.json`:
```json
{
    "autosu": true,
    "basename": false,
    "colorscheme": "meowrch",
    "cursorline": true,
    "eofnewline": true,
    "fastdirty": false,
    "fileformat": "unix",
    "ignorecase": true,
    "indentchar": " ",
    "infobar": true,
    "keepautoindent": true,
    "keymenu": false,
    "mouse": true,
    "pluginchannels": [
        "https://raw.githubusercontent.com/micro-editor/plugin-channel/master/channel.json"
    ],
    "pluginrepos": [],
    "rmtrailingws": true,
    "ruler": true,
    "savecursor": true,
    "saveundo": true,
    "scrollbar": true,
    "scrollmargin": 3,
    "scrollspeed": 2,
    "smartpaste": true,
    "softwrap": false,
    "splitbottom": true,
    "splitright": true,
    "statusformatl": "$(filename) $(modified)($(line),$(col)) $(status.paste)| ft:$(opt:filetype) | $(opt:fileformat) | $(opt:encoding)",
    "statusformatr": "$(bind:ToggleKeyMenu): bindings, $(bind:ToggleHelp): help",
    "statusline": true,
    "syntax": true,
    "tabmovement": true,
    "tabsize": 4,
    "tabstospaces": true,
    "useprimary": true
}
```

**Custom Key Bindings:**
Edit `bindings.json`:
```json
{
    "Alt-/": "lua:comment.comment",
    "CtrlUnderscore": "lua:comment.comment",
    "F1": "lua:help.showHelp",
    "F2": "lua:rename.rename",
    "F3": "FindNext",
    "F4": "FindPrevious",
    "Ctrl-r": "ReplaceCmd",
    "Ctrl-g": "command:goto ",
    "Alt-g": "command:goto ",
    "Ctrl-k": "CutLine",
    "Ctrl-d": "DuplicateLine",
    "Alt-Up": "MoveLinesUp",
    "Alt-Down": "MoveLinesDown"
}
```

## 🎨 Theming

### Neovim Colorschemes
LazyVim comes with multiple colorschemes:
```lua
-- lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      integrations = {
        telescope = true,
        nvimtree = true,
        treesitter = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
```

### Micro Colorschemes
Create custom colorscheme in `colorschemes/`:
```yaml
# colorschemes/my-theme.micro
color-link default "#f8f8f2,#282a36"
color-link comment "#6272a4"
color-link identifier "#50fa7b"
color-link constant "#bd93f9"
color-link statement "#ff79c6"
color-link symbol "#f1fa8c"
color-link preproc "#8be9fd"
color-link type "#8be9fd"
color-link special "#ffb86c"
color-link underlined "#f8f8f2"
color-link error "#ff5555"
color-link todo "#ff79c6"
color-link hlsearch "#282a36,#f1fa8c"
color-link statusline "#f8f8f2,#44475a"
color-link tabbar "#f8f8f2,#282a36"
color-link indent-char "#44475a,#282a36"
color-link line-number "#6272a4,#282a36"
color-link current-line-number "#f8f8f2,#44475a"
color-link diff-added "#50fa7b"
color-link diff-modified "#f1fa8c"
color-link diff-deleted "#ff5555"
color-link gutter-error "#ff5555"
color-link gutter-warning "#ffb86c"
color-link cursor-line "#44475a"
color-link color-column "#44475a"
```

## 🔌 Plugin Management

### Neovim Plugins (LazyVim)
Common plugin categories:
- **LSP**: `nvim-lspconfig`, `mason.nvim`
- **Completion**: `nvim-cmp`, `LuaSnip`
- **Fuzzy Finding**: `telescope.nvim`
- **Git**: `lazygit.nvim`, `gitsigns.nvim`
- **UI**: `neo-tree.nvim`, `lualine.nvim`
- **Syntax**: `nvim-treesitter`

### Micro Plugins
Install plugins via command mode:
```bash
# In micro
> plugin install filemanager
> plugin install comment
> plugin install jump
> plugin install manipulator
> plugin install quoter
```

## 🛠️ Language Support

### Neovim LSP Servers
Configured language servers:
- **TypeScript/JavaScript**: `tsserver`
- **Python**: `pyright`, `ruff-lsp`
- **Rust**: `rust-analyzer`
- **Go**: `gopls`
- **Lua**: `lua-ls`
- **JSON**: `jsonls`
- **YAML**: `yamlls`
- **Markdown**: `marksman`

### Adding New Languages
```lua
-- In LSP configuration
servers = {
  clangd = {}, -- C/C++
  hls = {},    -- Haskell
  zls = {},    -- Zig
}
```

## 📝 Workflow Tips

### Neovim Development Workflow
1. **Project Setup**: Use `:LazyExtras` to enable language-specific features
2. **File Navigation**: `<leader>ff` for files, `<leader>sg` for text search
3. **Code Navigation**: `gd` for definitions, `gr` for references
4. **Git Workflow**: `<leader>gg` for Lazygit integration
5. **Terminal**: `<C-/>` for integrated terminal

### Micro Development Workflow
1. **Quick Edits**: Ideal for configuration files and quick changes
2. **Multiple Files**: Use tabs for multiple file editing
3. **Search and Replace**: `Ctrl+R` for project-wide replacements
4. **Plugin Enhancement**: Install plugins for extended functionality

## 🔄 Integration

### Terminal Integration
Both editors integrate well with terminal multiplexers:
```bash
# Neovim in tmux/zellij
export EDITOR="nvim"
alias vim="nvim"
alias vi="nvim"

# Micro as quick editor
alias edit="micro"
alias m="micro"
```

### Shell Integration
```bash
# Fish shell abbreviations
abbr v nvim
abbr vim nvim
abbr m micro

# Zsh aliases
alias v="nvim"
alias vim="nvim"
alias m="micro"
```

## 🔗 Related Modules

- **[Shell](../shell/README.md)**: Shell configurations and editor integration
- **[Terminal](../terminal/README.md)**: Terminal emulators for optimal editor experience
- **[Tools](../tools/README.md)**: Development tools that integrate with editors