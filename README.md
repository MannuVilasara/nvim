# 🚀 Mannu's Neovim Configuration

> ⭐ **If you find this config helpful, please star the repository!** It motivates me to keep improving and adding new features.

A modern, feature-rich Neovim configuration built with Lua and managed by [lazy.nvim](https://github.com/folke/lazy.nvim). Organized, fast, and beautiful - just the way it should be.

---

## 📸 Screenshots

### Dashboard

<img width="1073" height="712" alt="image" src="https://github.com/user-attachments/assets/9a425691-3db6-44ad-8819-9736c42c9129" />

### Coding Interface

<img width="997" height="736" alt="image" src="https://github.com/user-attachments/assets/f4cc3efb-c920-452a-8253-a4f00957cf90" />

### File Explorer

<img width="1242" height="940" alt="image" src="https://github.com/user-attachments/assets/3ed24e6e-a2f6-4ffc-895b-2f356bdc1d67" />

### Command Palette

<img width="1128" height="773" alt="image" src="https://github.com/user-attachments/assets/2e6f037f-a884-4966-bbf7-2528cf4a57ae" />

## ✨ Features

- 🎨 **Beautiful UI** - Catppuccin theme with optional transparency
- 🎯 **Centered Command Palette** - Noice.nvim for beautiful cmdline with icons
- 📦 **Smart Plugin Management** - lazy.nvim with organized structure
- 🔍 **Fuzzy Finding** - Snacks picker for files, grep, buffers
- 🌳 **File Explorer** - Snacks explorer (nvim-tree and oil.nvim also available)
- 💡 **Full LSP Support** - Auto-completion, diagnostics, and formatting
- 🎯 **GitHub Copilot** - AI-powered code completion
- 🔄 **Git Integration** - LazyGit integration with diff support
- 📊 **Smart Statusline** - Shows git status, diagnostics, and "I use Arch btw"
- 🧪 **Testing** - vim-test integration
- 📝 **Markdown & API Preview** - Live preview for markdown and Swagger/OpenAPI
- 🐳 **Docker Management** - LazyDocker integration
- 🎭 **Discord Presence** - Show what you're coding with cord.nvim
- 🎵 **Now Playing** - Dashboard shows current song via playerctl
- 🎨 **Code Folding** - nvim-ufo for smart folding
- ⚡ **Fast Startup** - Optimized lazy loading (~80ms with 26+ plugins)

---

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

Plugins are organized into categories for better maintainability. See [STRUCTURE.md](STRUCTURE.md) for the complete organization guide.

### Core

- **lazy.nvim** - Modern plugin manager
- **plenary.nvim** - Lua utility functions

### UI & Appearance (`lua/plugins/ui/`)

- **catppuccin** - Beautiful color scheme with transparency support
- **lualine.nvim** - Customizable statusline with git, diagnostics, and OS info
- **bufferline.nvim** - Buffer/tab line with navigation shortcuts
- **noice.nvim** - Enhanced cmdline with centered popup and icons
- **nvim-web-devicons** - File icons everywhere
- **nvim-colorizer.lua** - Live color preview
- **dressing.nvim** - Better UI for input/select
- **fidget.nvim** - LSP progress notifications
- **snacks.nvim** - Dashboard with now playing and utilities

### Editor (`lua/plugins/editor/`)

- **nvim-treesitter** - Better syntax highlighting and code understanding
- **nvim-autopairs** - Auto-close brackets and quotes
- **comment.nvim** - Smart commenting (gcc, gbc)
- **which-key.nvim** - Keybinding hints popup
- **nvim-ufo** - Smart code folding with treesitter
- **nvim-tree.lua** - File explorer sidebar
- **oil.nvim** - Edit filesystem like a buffer

### LSP & Completion (`lua/plugins/lsp/`)

- **nvim-lspconfig** - Easy LSP server configurations
- **nvim-cmp** - Powerful completion engine
- **cmp-nvim-lsp** - LSP completion source
- **cmp-buffer** - Buffer word completion
- **cmp-path** - File path completion
- **LuaSnip** - Snippet engine
- **cmp_luasnip** - Snippet completion source
- **none-ls.nvim** - Formatting and linting
- **conform.nvim** - Fast code formatter

### Tools (`lua/plugins/tools/`)

- **copilot.lua** - GitHub Copilot integration
- **toggleterm.nvim** - Terminal management
- **lazydocker.nvim** - Docker TUI integration
- **vim-test** - Test runner
- **cord.nvim** - Discord Rich Presence
- **nvim-tmux-navigation** - Seamless tmux/vim navigation
- **rails.nvim** - Ruby on Rails utilities
- **markdown-preview.nvim** - Live markdown preview
- **swagger-preview.nvim** - Swagger/OpenAPI preview

---

## ⌨️ Key Bindings

### General

- `<leader>` is set to `Space`

### Dashboard (Snacks)

- `f` - Find File
- `n` - New File
- `g` - Find Text (Grep)
- `r` - Recent Files
- `c` - Open Config
- `L` - Lazy Plugin Manager
- `q` - Quit

### Fuzzy Finding

- `<C-p>` - Find Files
- `<leader><leader>` - Recent Files
- `<leader>fb` - Buffers
- `<leader>fg` - Grep Files
- `<leader>p` - Command Palette
- `<leader>fh` - Help Pages
- `<leader>fc` - Colorschemes
- `<leader>fk` - Keymaps

### File Explorer

- `<leader>ee` - Toggle Explorer

### Buffer Navigation

- `Tab` - Next Buffer
- `Shift+Tab` - Previous Buffer
- `<leader>bd` - Delete Buffer
- `<leader>bb` - Pick Buffer
- `<leader>b1-9` - Go to Buffer 1-9

### Git

- `<leader>lg` - LazyGit
- `<leader>gl` - LazyGit Log (current file)

### Scratch Buffer

- `<leader>sf` - Toggle Scratch Buffer
- `<leader>S` - Select Scratch Buffer

### Code Folding (UFO)

- `zR` - Open all folds
- `zM` - Close all folds
- `za` - Toggle fold under cursor
- `zj` - Go to next fold
- `zk` - Go to previous fold

### Fidget Notifications (Demo)

- `<leader>na` - Info notification
- `<leader>nb` - Warning notification
- `<leader>nc` - Notification with annotation
- `<leader>np` - Progress spinner demo

---

## 🎨 Customization

### Transparency Toggle

Edit `lua/plugins/ui/catppuccin.lua` and change:

```lua
local transparent = true -- Set to false to disable transparency
```

### Changing Theme Variant

In `lua/plugins/ui/catppuccin.lua`, change the colorscheme command:

```lua
vim.cmd.colorscheme("catppuccin-mocha")  -- mocha, macchiato, frappe, or latte
```

### Adding Plugins

Add new plugin files in the appropriate category:

- UI plugins → `lua/plugins/ui/`
- Editor plugins → `lua/plugins/editor/`
- LSP plugins → `lua/plugins/lsp/`
- Tools → `lua/plugins/tools/`

They will be automatically loaded by lazy.nvim.

### Modifying Keybindings

- Core options: `lua/core/options.lua` (or `lua/vim-options.lua` if not migrated)
- Plugin-specific: Edit the individual plugin file

---

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point with lazy.nvim setup
├── lazy-lock.json              # Plugin version lock file
├── STRUCTURE.md                # Organization guide
├── reorganize.sh               # Migration script
├── README.md                   # This file
│
├── lua/
│   ├── core/                   # Core configuration (optional, organized structure)
│   │   └── options.lua         # Vim options and settings
│   │
│   ├── vim-options.lua         # Vim options (legacy, can be migrated to core/)
│   ├── plugins.lua             # Lazy.nvim bootstrap
│   │
│   └── plugins/                # Plugin configurations (organized by category)
│       ├── ui/                 # UI & Appearance
│       │   ├── catppuccin.lua
│       │   ├── lualine.lua
│       │   ├── bufferline.lua
│       │   ├── noice.lua
│       │   ├── snacks.lua
│       │   ├── dressing.lua
│       │   ├── fidget.lua
│       │   └── nvim-colorizer.lua
│       │
│       ├── editor/             # Editor enhancements
│       │   ├── treesitter.lua
│       │   ├── autopairs.lua
│       │   ├── comment.lua
│       │   ├── which-key.lua
│       │   ├── ufo.lua
│       │   ├── nvim-tree.lua
│       │   └── oil.lua
│       │
│       ├── lsp/                # LSP & Completion
│       │   ├── lsp-config.lua
│       │   ├── completions.lua
│       │   ├── none-ls.lua
│       │   └── formatting.lua
│       │
│       ├── git/                # Git tools (future)
│       │
│       └── tools/              # Development tools
│           ├── copilot.lua
│           ├── toggleterm.lua
│           ├── lazydocker.lua
│           ├── vim-test.lua
│           ├── cord.lua
│           └── ...
```

---

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

1. **Health Check** - Use `:checkhealth` to diagnose issues
2. **Plugin Manager** - Run `:Lazy` to manage plugins
3. **LSP Servers** - Use `:Mason` to install LSP servers, formatters, and linters
4. **Keybinding Help** - Press `<leader>` and wait to see available keybindings (which-key)
5. **Transparency** - Toggle in `lua/plugins/ui/catppuccin.lua` with one line
6. **Now Playing** - Dashboard shows your current song via playerctl (Spotify, VLC, etc.)
7. **Command Palette** - Press `:` for centered command palette with icons
8. **Code Folding** - Use `za` to toggle folds, `zR`/`zM` to open/close all

---

## 🤝 Contributing

Feel free to fork this repository and customize it to your needs! Found a bug or have a suggestion? Open an issue!

---

## 📝 License

MIT License - Feel free to use and modify as you wish.

---

## 🙏 Acknowledgments

Thanks to the Neovim community and all plugin authors for their amazing work!

Special thanks to:

- [folke](https://github.com/folke) - For lazy.nvim, noice.nvim, and snacks.nvim
- [catppuccin](https://github.com/catppuccin) - For the beautiful theme
- The entire Neovim community for making this possible

---

## ⭐ Support

If this configuration helped you or inspired your setup, please consider:

- ⭐ **Starring the repository** - It really motivates me!
- 🍴 **Forking and customizing** - Make it your own
- 🐛 **Reporting issues** - Help improve it for everyone
- 💬 **Sharing feedback** - Let me know what you think

**Star the repo if you found it helpful! It means a lot to me! ⭐**

---

**Note:** I use Arch btw 🐧
