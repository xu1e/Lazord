# 🌙 Lazord

A modern, elegant dark theme for Neovim and your entire development environment. Inspired by contemporary design principles with carefully chosen colors for optimal readability and visual appeal.

## ✨ Features

- 🎨 **Carefully crafted color palette** designed for reduced eye strain
- 🔧 **Highly configurable** with extensive customization options
- 🌐 **Universal theming** - consistent colors across all your tools
- 🚀 **Modern Neovim support** with Tree-sitter and LSP integration
- 📱 **Plugin ecosystem** support for popular Neovim plugins
- 🎯 **Developer-focused** design optimized for long coding sessions


## 🎨 Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| **Background** | `#1e1e1e` | Main background |
| **Foreground** | `#c8c8c8` | Primary text |
| **Blue** | `#4dabf7` | Functions, links, primary accent |
| **Green** | `#51cf66` | Strings, success states |
| **Yellow** | `#ffa500` | Warnings, numbers |
| **Red** | `#ff6b6b` | Errors, important keywords |
| **Purple** | `#cc5de8` | Keywords, constants |
| **Cyan** | `#22d3ee` | Types, information |
| **Comment** | `#8b8b8b` | Comments, subtle text |

### Design Principles
- **High contrast** for excellent readability
- **Reduced blue light** to minimize eye strain
- **Semantic color usage** for intuitive code understanding
- **Balanced saturation** for comfortable long-term use

## 🚀 Installation

### Requirements
- Neovim >= 0.8.0
- `termguicolors` enabled
- A terminal that supports true color

### Using [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

```lua
{
  "xu1e/Lazord",
  name = "lazord",
  lazy = false,
  priority = 1000,
  config = function()
    require("Lazord").setup({
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
    })
    vim.cmd.colorscheme("Lazord")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "xu1e/Lazord",
  config = function()
    require("Lazord").setup()
    vim.cmd.colorscheme("Lazord")
  end
}
```

### Manual Installation

1. Clone the repository:
```bash
git clone https://github.com/xu1e/Lazord.git ~/.config/nvim/colors/lazord
```

2. Add to your `init.lua`:
```lua
vim.opt.rtp:prepend("~/.config/nvim/colors/lazord")
require("Lazord").setup()
vim.cmd.colorscheme("Lazord")
```

## ⚙️ Configuration

Lazord is highly customizable. Here are the available options:

```lua
require("Lazord").setup({
  -- Enable transparent background (requires terminal support)
  transparent = false,
  
  -- Apply Lazord colors to Neovim's built-in terminal
  terminal_colors = true,
  
  -- Style configurations for different syntax elements
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    strings = {},
    -- Background styles for sidebar-like windows
    sidebars = "dark", -- "dark", "transparent" or "normal"
    floats = "dark",   -- "dark", "transparent" or "normal"
  },
  
  -- Sidebar windows that should have darker background
  sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
  
  -- Dim inactive windows
  dim_inactive = false,
  
  -- Hide inactive statuslines with a thin border
  hide_inactive_statusline = false,
  
  -- Make lualine section headers bold
  lualine_bold = false,
  
  ---@param colors ColorScheme
  on_colors = function(colors)
    -- Modify colors before they're used
    -- colors.comment = "#7c7c7c"
  end,
  
  ---@param highlights Highlights
  ---@param colors ColorScheme  
  on_highlights = function(highlights, colors)
    -- Add or modify highlight groups
    -- highlights.Comment = { fg = colors.comment, italic = true }
  end,
})
```


## 🔌 Plugin Support

Lazord provides comprehensive theming for popular Neovim plugins:

### Core Plugins
- 🔍 **Telescope** - Fuzzy finder with matching colors
- 🌳 **NvimTree/Neo-tree** - File explorer integration  
- 📊 **Lualine** - Beautiful status line theming
- 🔔 **nvim-notify** - Notification styling
- ❓ **WhichKey** - Keybinding popup theming

### Development Tools
- 🚀 **LSP** - Native LSP highlighting and diagnostics
- 🌲 **Tree-sitter** - Enhanced syntax highlighting  
- 🔧 **Mason** - LSP installer theming
- 📝 **nvim-cmp** - Completion menu styling
- 🎯 **Trouble** - Diagnostics list theming

### Git Integration
- 📋 **GitSigns** - Git change indicators
- 📊 **LazyGit** - Git TUI theming (see extras/)
- 🔀 **Neogit** - Git interface theming
- 📈 **DiffView** - Diff viewer integration

### UI Enhancements
- 🎨 **Alpha/Dashboard** - Start screen theming
- 📍 **Indent Blankline** - Enhanced indentation guides with rainbow colors
- 🔮 **Noice** - Enhanced UI elements
- ⚡ **Mini.nvim** - Mini plugin suite support including indentscope
- 🎨 **Rainbow** - Bracket pair colorization


## 🌐 Universal Theming (Extras)

Extend Lazord beyond Neovim to your entire development environment:

### Terminals
- **iTerm2** - macOS terminal with full color support
- **Ghostty** - Modern GPU-accelerated terminal

### Shells  
- **Zsh** - Enhanced prompt and colors
- **Bash** - Classic shell with Lazord colors
- **Fish** - Modern shell with syntax highlighting

### Development Tools
- **FZF** - Fuzzy finder with matching colors
- **Tmux** - Terminal multiplexer theming
- **LazyGit** - Beautiful Git TUI

### macOS Tools
- **AeroSpace** - Tiling window manager configuration
- **SketchyBar** - Custom menu bar theming

### Installation Examples

```bash
# FZF integration
echo 'source ~/path/to/Lazord/extras/fzf/lazord.sh' >> ~/.zshrc

# Tmux theming  
echo 'source-file ~/path/to/Lazord/extras/tmux/lazord.tmux' >> ~/.tmux.conf

# Fish shell colors
echo 'source ~/path/to/Lazord/extras/fish/lazord.fish' >> ~/.config/fish/config.fish
```

See the [`extras/`](./extras/) directory for complete installation instructions.

## 📁 Theme Integration Files

Lazord includes several integration files for easy setup:

### Core Integration Files
- **`lua/lazord-indent-blankline.lua`** - Standalone indent-blankline configuration
- **`lazord-indent-integration.lua`** - Usage examples and documentation
- **`lazord-theme-transparent.lua`** - Complete transparent theme setup
- **`debug_indent.lua`** - Debug script for indent-blankline colors
- **`debug_functions.lua`** - Debug script for function colors
- **`debug_transparency.lua`** - Debug script for transparency features

### Quick Start Files

Use these files to quickly integrate Lazord with your setup:

```lua
-- For basic indent-blankline integration
require("lazord-indent-blankline")

-- For complete transparent theme
require("lazord-theme-transparent")

-- For debugging colors
:luafile debug_indent.lua
```

## 🎯 Design Philosophy

Lazord is built on these core principles:

1. **👁️ Reduced Eye Strain** - Carefully balanced contrast and reduced blue light
2. **🎨 Semantic Consistency** - Colors have meaning across all contexts  
3. **⚡ Enhanced Productivity** - Minimize visual noise, maximize focus
4. **🌍 Universal Experience** - Consistent theming across your entire workflow
5. **🎭 Modern Aesthetics** - Contemporary design that ages well

## 📸 Screenshots

> 🔄 Screenshots coming soon! We're working on showcasing Lazord across different environments.

## �️ Roadmap

- [ ] Light theme variant
- [ ] Additional terminal support (Alacritty, Wezterm)
- [ ] VSCode port
- [ ] Zellij terminal multiplexer theme
- [ ] Additional shell prompt themes

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **🐛 Report Issues** - Found a bug? Let us know!
2. **✨ Request Features** - Have an idea? We'd love to hear it!
3. **🔧 Submit PRs** - Code contributions are always welcome
4. **📱 Add App Support** - Help us theme more applications

### Development Setup

```bash
git clone https://github.com/xu1e/Lazord.git
cd Lazord

# Test the theme
nvim --cmd "set rtp+=." --cmd "colorscheme Lazord"
```

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by modern design principles and developer workflows
- Built with ❤️ for the Neovim community
- Special thanks to all contributors and users

---

**Made with 🌙 by the Lazord team**
