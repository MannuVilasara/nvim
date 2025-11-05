# 🚀 My Neovim Configuration

A modern, feature-rich Neovim configuration built with Lua and managed by [lazy.nvim](https://github.com/folke/lazy.nvim).

## ✨ Features

- 🎨 **Beautiful UI** with Catppuccin theme
- 📦 **Plugin Management** via lazy.nvim
- 🔍 **Fuzzy Finding** with Snacks picker
- 🌳 **File Explorer** with nvim-tree and oil.nvim (disabled by default as snacks handle it well)
- 💡 **LSP Support** with auto-completion and diagnostics
- 🎯 **GitHub Copilot** integration
- 🔄 **Git Integration** with LazyGit and diff support
- 🧪 **Testing** with vim-test
- 📝 **Markdown Preview** support (disabled by default)
- 🐳 **Docker Management** with LazyDocker
- 🎭 **Discord Presence** with cord.nvim
- ⚡ **Fast Startup** with optimized lazy loading

## 📋 Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (recommended: JetBrainsMono Nerd Font)
- Node.js (for LSP servers and Copilot)
- Ripgrep (for grep functionality)
- LazyGit (optional, for git integration)
- LazyDocker (optional, for docker management)
- tmux (for splitting tabs)

## 🚀 Installation

### Linux/macOS

```bash
# Backup your existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repository
git clone https://github.com/MannuVilasara/nvim.git ~/.config/nvim

# Start Neovim
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## 📦 Plugins

### Core

- **lazy.nvim** - Plugin manager
- **plenary.nvim** - Lua utility functions

### UI & Appearance

- **catppuccin** - Color scheme
- **lualine.nvim** - Statusline with git, diagnostics, and "I use Arch btw"
- **bufferline.nvim** - Buffer/tab line
- **nvim-web-devicons** - File icons
- **nvim-colorizer.lua** - Color highlighter
- **dressing.nvim** - Better UI for input/select
- **fidget.nvim** - LSP progress indicator
- **snacks.nvim** - Dashboard and utilities

### Editor

- **nvim-treesitter** - Syntax highlighting and code understanding
- **nvim-autopairs** - Auto-close pairs
- **comment.nvim** - Smart commenting
- **which-key.nvim** - Keybinding popup

### File Navigation

- **nvim-tree.lua** - File explorer
- **oil.nvim** - Edit filesystem like a buffer
- **snacks.picker** - Fuzzy finder for files, grep, buffers

### LSP & Completion

- **nvim-lspconfig** - LSP configurations
- **nvim-cmp** - Completion engine
- **cmp-nvim-lsp** - LSP completion source
- **cmp-buffer** - Buffer completion source
- **cmp-path** - Path completion source
- **LuaSnip** - Snippet engine
- **cmp_luasnip** - Snippet completion source

### Git

- **lazygit.nvim** - LazyGit integration
- **gitsigns.nvim** - Git decorations

### Code Quality

- **none-ls.nvim** - Formatting and linting
- **conform.nvim** - Code formatter

### Language Support

- **vim-rails** - Ruby on Rails support
- **markdown-preview.nvim** - Markdown preview
- **swagger-preview.nvim** - Swagger/OpenAPI preview

### Tools

- **toggleterm.nvim** - Terminal management
- **vim-test** - Test runner
- **lazydocker.nvim** - Docker management
- **copilot.lua** - GitHub Copilot
- **cord.nvim** - Discord Rich Presence
- **nvim-tmux-navigation** - Seamless tmux navigation

## ⌨️ Key Bindings

### General

- `<leader>` is set to `Space`

### Dashboard (Snacks)

- `f` - Find File
- `n` - New File
- `g` - Find Text (Grep)
- `r` - Recent Files
- `c` - Config
- `L` - Lazy Plugin Manager
- `q` - Quit

### File Navigation

- `<C-p>` - Find Files
- `<leader><leader>` - Recent Files
- `<leader>fb` - Buffers
- `<leader>fg` - Grep Files
- `<leader>ee` - Toggle Explorer

### Git

- `<leader>lg` - LazyGit
- `<leader>gl` - LazyGit Log (current file)

### Scratch Buffer

- `<leader>sf` - Toggle Scratch Buffer
- `<leader>S` - Select Scratch Buffer

### Terminal

- `<leader>t` - Toggle Terminal (configured in toggleterm)

## 🎨 Customization

### Changing Theme

Edit `lua/plugins/catppuccin.lua` to customize the Catppuccin theme variant (mocha, macchiato, frappe, latte).

### Adding Plugins

Add new plugin files in `lua/plugins/` directory. They will be automatically loaded by lazy.nvim.

### Modifying Keybindings

Edit `lua/vim-options.lua` for general keybindings or individual plugin files for plugin-specific bindings.

## 📁 Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json              # Plugin version lock file
├── lua/
│   ├── vim-options.lua         # Vim options and general settings
│   ├── plugins.lua             # Lazy.nvim setup
│   └── plugins/                # Individual plugin configurations
│       ├── autopairs.lua
│       ├── bufferline.lua
│       ├── catppuccin.lua
│       ├── cmdpalette.lua
│       ├── comment.lua
│       ├── completions.lua
│       ├── copilot.lua
│       ├── cord.lua
│       ├── dressing.lua
│       ├── fidget.lua
│       ├── formatting.lua
│       ├── lazydocker.lua
│       ├── lsp-config.lua
│       ├── lualine.lua
│       ├── markdown-preview.lua
│       ├── nerdy-icons.lua
│       ├── none-ls.lua
│       ├── nvim-colorizer.lua
│       ├── nvim-tmux-navigation.lua
│       ├── nvim-tree.lua
│       ├── oil.lua
│       ├── rails.lua
│       ├── snacks.lua
│       ├── swagger-preview.lua
│       ├── toggleterm.lua
│       ├── treesitter.lua
│       ├── vim-test.lua
│       └── which-key.lua
```

## 🔧 Troubleshooting

### Plugins not installing

```bash
# Inside Neovim
:Lazy sync
```

### LSP not working

```bash
# Inside Neovim
:LspInfo
:Mason
```

### Treesitter errors

```bash
# Inside Neovim
:TSUpdate
```

## 💡 Tips

1. Use `:checkhealth` to diagnose issues
2. Run `:Lazy` to manage plugins
3. Use `:Mason` to install LSP servers, formatters, and linters
4. Press `<leader>` and wait to see available keybindings (which-key)
5. The statusline shows "Arch" to proudly display your OS choice

## 🤝 Contributing

Feel free to fork this repository and customize it to your needs!

## 📝 License

MIT License - Feel free to use and modify as you wish.

## 🙏 Acknowledgments

Thanks to the Neovim community and all plugin authors for their amazing work!

Please star the repo. It motivates me that people do like my work so I should keep working on amazing things ⭐

**Note:** I use Arch btw 🐧
