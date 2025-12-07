# Neovim dependencies install script
# Run in PowerShell: .\install-deps.ps1

Write-Host "Installing Neovim dependencies..." -ForegroundColor Cyan

# Core tools
Write-Host "`n[1/7] Core tools" -ForegroundColor Yellow
winget install Neovim.Neovim --accept-source-agreements --accept-package-agreements
winget install Git.Git --accept-source-agreements --accept-package-agreements
winget install BurntSushi.ripgrep.MSVC --accept-source-agreements --accept-package-agreements

# Languages
Write-Host "`n[2/7] Language runtimes" -ForegroundColor Yellow
winget install GoLang.Go --accept-source-agreements --accept-package-agreements
winget install Python.Python.3.12 --accept-source-agreements --accept-package-agreements
winget install OpenJS.NodeJS --accept-source-agreements --accept-package-agreements

# Build tools
Write-Host "`n[3/7] Build tools (for treesitter)" -ForegroundColor Yellow
winget install LLVM.LLVM --accept-source-agreements --accept-package-agreements

# Optional tools
Write-Host "`n[4/7] Optional tools" -ForegroundColor Yellow
winget install sharkdp.fd --accept-source-agreements --accept-package-agreements

# Refresh PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Python packages
Write-Host "`n[5/7] Python packages" -ForegroundColor Yellow
pip install pynvim black

# Node packages
Write-Host "`n[6/7] Node packages" -ForegroundColor Yellow
npm install -g prettier

Write-Host "`n[7/7] Complete!" -ForegroundColor Green
Write-Host @"

Next steps:
1. Restart your terminal to pick up PATH changes
2. Open nvim - plugins will auto-install
3. Run :Lazy sync
4. Run :checkhealth to verify

"@ -ForegroundColor Cyan
