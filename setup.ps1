Set-StrictMode -Version Latest

$currentUser = $env:USERNAME

# Install scoop
if(!(Test-Path "C:\Users\$currentUser\scoop")){
    Invoke-RestMethod -Uri 'https://get.scoop.sh' | Invoke-Expression
} else {
    Write-Host "Scoop already installed"
}

Write-Host "Installing scoop packages"

# Install scoop packages
scoop bucket add main
scoop install main/wget
scoop install main/oh-my-posh
scoop install extras/terminal-icons
scoop install main/7zip
scoop install main/fzf
scoop install main/grep
scoop install main/1password-cli

# Install Git
if (!(Test-Path "C:\Program Files\Git\cmd\git.exe")) {
    Write-Host "Installing Git"
    wget install --id Git.Git -e --source winget
} else {
    Write-Host "Git already installed"
}