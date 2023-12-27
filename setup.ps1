Set-StrictMode -Version Latest

$currentUser = $env:USERNAME

function downloadFile {
    param(
        [string]$url,
        [string]$output
    )

    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url, $output)
}

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
    },
    @{
        name='hyper'
        bucket='extras'
        slug='extras/hyper'
    },
    @{
        name='nvm'
        bucket='main'
        slug='main/nvm'
    },
    @{
        name='postman'
        bucket='extras'
        slug='extras/postman'
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

New-Item -ItemType Directory -Path "C:\Users\$currentUser\.config" -Force -Name dotfiles
New-Item -ItemType Directory -Path "C:\Users\$currentUser\.config" -Force -Name dotfiles\shell
New-Item -ItemType File -Path "C:\Users\$currentUser\.config\dotfiles\shell" -Force -Name aliases.ps1
New-Item -ItemType File -Path "C:\Users\$currentUser\.config\dotfiles\shell" -Force -Name profile.ps1
New-Item -ItemType File -Path "C:\Users\$currentUser\.config\dotfiles\shell" -Force -Name hyper.js

Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/santiagohernandezs/dot/main/shell/aliases.ps1' -OutFile "C:\Users\$currentUser\.config\dotfiles\shell\aliases.ps1"
Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/santiagohernandezs/dot/main/shell/profile.ps1' -OutFile "C:\Users\$currentUser\.config\dotfiles\shell\profile.ps1"

Remove-Item -Path "C:\Users\$currentUser\AppData\Roaming\Hyper\.hyper.js" -Force
Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/santiagohernandezs/dot/main/shell/.hyper.js' -OutFile "C:\Users\$currentUser\.config\dotfiles\shell\hyper.js" -Force

New-Item -ItemType SymbolicLink -Path "C:\Users\$currentUser\AppData\Roaming\Hyper" -Target "C:\Users\$currentUser\.config\dotfiles\shell\hyper.js" -Force
