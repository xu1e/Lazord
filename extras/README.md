# ⚙️ Lazord System Tools & Extras

Advanced system tools and development utilities themed with Lazord colors.

## Available Tools

### System & Window Management
- **aerospace/** - AeroSpace tiling window manager configuration
- **sketchybar/** - macOS menu bar customization theme
- **tmux/** - Terminal multiplexer with unified theme

### Development Tools
- **fzf/** - Fuzzy finder with Lazord color integration
- **lazygit/** - Git TUI with beautiful Lazord styling

## Installation

### AeroSpace Window Manager

Copy the configuration to your AeroSpace directory:

```bash
cp ~/path/to/Lazord/extras/aerospace/lazord.toml ~/.aerospace.toml
```

### SketchyBar Menu Bar

Source in your SketchyBar configuration:

```bash
source ~/path/to/Lazord/extras/sketchybar/lazord.sh
```

### Tmux Terminal Multiplexer

Add to your `~/.tmux.conf`:

```bash
source-file ~/path/to/Lazord/extras/tmux/lazord.tmux
```

### FZF Fuzzy Finder

Add to your shell configuration (`.bashrc`, `.zshrc`, etc.):

```bash
source ~/path/to/Lazord/extras/fzf/lazord.sh
```

### LazyGit Git TUI

Copy to your LazyGit config directory:

```bash
cp ~/path/to/Lazord/extras/lazygit/lazord.yml ~/.config/lazygit/config.yml
```

## Features

- Seamless integration with Neovim theme
- macOS system-level theming support
- Development workflow optimization
- Consistent color scheme across all tools
- High contrast for excellent readability

## Color Palette

All configurations use the unified Lazord color palette:

- **Background**: `#001e27`
- **Foreground**: `#708284`
- **Blue**: `#2176c7`
- **Green**: `#738a05`
- **Yellow**: `#a57706`
- **Red**: `#d11c24`
- **Purple**: `#c61c6f`
- **Cyan**: `#259286`
- **Comment**: `#475b62`
