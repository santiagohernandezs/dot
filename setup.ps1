Set-StrictMode -Version Latest

$currentUser = $env:USERNAME

Write-Host "Installing config files"

# Install scoop
if(!(Test-Path "C:\Users\$currentUser\scoop")){
    Write-Host "Installing scoop"
    Invoke-RestMethod -Uri 'https://get.scoop.sh' | Invoke-Expression
} else {
    Write-Host "Scoop already installed"
}

Write-Host "Installing scoop packages"

$packages = @{
    winget='main/wget'
    'oh-my-posh'='main/oh-my-posh'
    'teminal-icons'='extras/terminal-icons'
    '7zip'='main/7zip'
    fzf= 'main/fzf'
    git='main/git'
    grep='main/grep'
    '1password-cli'='main/1password-cli'
}

# Install scoop packages
foreach($package in $packages.GetEnumerator()){
    if(!(scoop which $package.Key)){
        scoop install $package.Value
    } else {
        Write-Host "$($package.Key) already installed"
    }
}
