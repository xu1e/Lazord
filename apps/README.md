# 📱 Lazord App Themes

Terminal application themes that match your Neovim colorscheme perfectly.

## Available Applications

- **ghostty/** - Modern GPU-accelerated terminal emulator
- **iterm2/** - Advanced terminal emulator for macOS

## Installation

### iTerm2

1. Open iTerm2 → Preferences → Profiles → Colors
2. Click "Color Presets" → Import
3. Select `apps/iterm2/Lazord.itermcolors`
4. Choose "Lazord" from the presets

### Ghostty

Add to your Ghostty configuration:

```bash
# Add to ~/.config/ghostty/config
cat ~/path/to/Lazord/apps/ghostty/lazord >> ~/.config/ghostty/config
```

Or manually copy the configuration from `apps/ghostty/lazord`.

## Features

- Perfect color matching with Neovim theme
- Consistent contrast and readability
- Support for transparency and advanced terminal features
- Optimized for development workflows

## Color Palette

All applications use the unified Lazord color palette:
- Background: `#001e27`
- Foreground: `#708284`
- Blue: `#2176c7`
- Green: `#738a05`
- And more...