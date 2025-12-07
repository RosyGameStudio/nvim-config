# Neovim Configuration Setup

## Prerequisites

Install these dependencies via winget before using this config:

```powershell
# Required
winget install Neovim.Neovim
winget install BurntSushi.ripgrep.MSVC    # Telescope live_grep
winget install Git.Git

# Language support
winget install GoLang.Go                   # Go LSP (gopls)
winget install Python.Python.3.12          # Python LSP (pyright)
winget install OpenJS.NodeJS               # JSON LSP, prettier formatter

# Optional but recommended
winget install sharkdp.fd                  # Faster file finding for Telescope
winget install LLVM.LLVM                   # clang for treesitter parser compilation
```

## Python packages

```powershell
pip install pynvim                         # Neovim Python provider
pip install black                          # Python formatter
```

## Node packages

```powershell
npm install -g prettier                    # JSON/Markdown formatter
```

## Lua packages (optional)

```powershell
winget install DEVCOM.Lua
winget install LuaRocks.LuaRocks
```

## Go packages

gopls is auto-installed by Mason, but if needed manually:
```powershell
go install golang.org/x/tools/gopls@latest
```

## Other formatters

```powershell
# Lua formatter (for stylua)
cargo install stylua
# Or via Mason: :MasonInstall stylua
```

## After installation

1. Restart your terminal to pick up new PATH entries
2. Clone/copy this config to `%LOCALAPPDATA%\nvim`
3. Open Neovim - lazy.nvim will auto-install plugins
4. Run `:Lazy sync` to ensure all plugins are installed
5. Run `:checkhealth` to verify everything is working

## Quick install script

Save as `install-deps.ps1` and run in PowerShell:

```powershell
# Core
winget install Neovim.Neovim
winget install Git.Git
winget install BurntSushi.ripgrep.MSVC

# Languages
winget install GoLang.Go
winget install Python.Python.3.12
winget install OpenJS.NodeJS
winget install LLVM.LLVM

# Optional
winget install sharkdp.fd

# Python packages
pip install pynvim black

# Node packages
npm install -g prettier

Write-Host "Done! Restart your terminal, then open nvim."
```
