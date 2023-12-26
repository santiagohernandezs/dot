Set-StrictMode -Version Latest

$currentUser = $env:USERNAME

# Install scoop
if(!(Test-Path "C:\Users\$currentUser\scoop")){
    Invoke-RestMethod -Uri 'https://get.scoop.sh' | Invoke-Expression
} else {
    Write-Host "Scoop already installed"
}

Write-Host "Installing scoop packages"

$packages = @(
    'main/wget',
    'main/oh-my-posh',
    'extras/terminal-icons',
    'main/7zip',
    'main/fzf',
    'main/grep',
    'main/1password-cli',
    'main/winget'
)

# Install scoop packages
foreach($package in $packages){
    if(!(scoop which $package)){
        scoop install $package
    } else {
        Write-Host "$package already installed"
    }
}

# Install Git
if (!(Test-Path "C:\Program Files\Git\cmd\git.exe")) {
    Write-Host "Installing Git"

    Invoke-RestMethod -Uri 'https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe' | Invoke-Expression

} else {
    Write-Host "Git already installed"
}

