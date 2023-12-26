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

$packages = @(
    @{
        name='winget'
        bucket='main'
        slug='main/wget'
    },
    @{
        name='oh-my-posh'
        bucket='main'
        slug='main/oh-my-posh'
    },
    @{
        name='teminal-icons'
        bucket='extras'
        slug='extras/terminal-icons'
    },
    @{
        name='7zip'
        bucket='main'
        slug='main/7zip'
    },
    @{
        name='fzf'
        bucket='main'
        slug='main/fzf'
    },
    @{
        name='git'
        bucket='main'
        slug='main/git'
    },
    @{
        name='grep'
        bucket='main'
        slug='main/grep'
    },
    @{
        name='1password-cli'
        bucket='main'
        slug='main/1password-cli'
    },
    @{
        name='vscode'
        bucket='extras'
        slug='extras/vscode'
    },
    @{
        name='pwsh'
        bucket='main'
        slug='main/pwsh'
    }
)

# Install scoop packages
foreach($package in $packages){
    if(!(scoop which $package.name)){
        scoop bucket add $package.bucket
        scoop install $package.slug
    } else {
        Write-Host "$($package.name) already installed"
    }
}

