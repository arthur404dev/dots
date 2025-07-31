# AGENTS.md - Dotfiles Repository Guide

## Repository Type
This is a **dotfiles repository** using GNU Stow for configuration management across multiple categories (shell, terminal, editor, wm, tools, theme, media, ai, apps, system).

## Build/Test/Lint Commands
```bash
# No traditional build system - this is a configuration repository
# Install configurations using GNU Stow
stow shell terminal editor    # Install specific packages
stow */                       # Install all packages
stow -R package_name          # Reinstall package after changes
stow -D package_name          # Remove package

# System-level configurations (require sudo)
sudo stow system -t /        # Install system configs (GRUB, SDDM)
sudo grub-mkconfig -o /boot/grub/grub.cfg  # Regenerate GRUB config after changes
sudo systemctl restart sddm  # Restart SDDM after config changes

# Test configurations
# No automated tests - manual verification required after stowing
```

## Code Style Guidelines

### Shell Scripts (.sh files)
- Use `#!/usr/bin/env bash` shebang
- 4-space indentation
- Variables in lowercase with underscores: `first_loaded_model`
- Quote variables: `"$variable"`
- Use `[[ ]]` for conditionals instead of `[ ]`

### Configuration Files
- Use consistent indentation (spaces preferred)
- Comment sections clearly with `#` or `//`
- Follow existing patterns within each config type
- Keep related settings grouped together

### File Organization
- Mirror home directory structure under each package
- Use `.config/` subdirectories for XDG-compliant apps
- Group related configurations in logical packages
- Maintain consistent naming: lowercase with hyphens for directories
- System-level configs in `system/` package mirror `/etc` structure

### Error Handling
- Check command success with `|| fallback`
- Use meaningful error messages
- Provide graceful fallbacks for missing dependencies

This repository focuses on configuration management rather than code development.