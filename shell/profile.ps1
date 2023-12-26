# Oh-My-Posh config
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/zash.omp.json" | Invoke-Expression

# For Windows Terminal Icons
Import-Module -Name Terminal-Icons

# FZF config
Set-PSFzfOption -EnableAliasFuzzyEdit
Set-PSFzfOption -EnableAliasFuzzyZLocation
Set-PSFzfOption -EnableAliasFuzzySetLocation
Set-PSFzfOption -EnableAliasFuzzyGitStatus
Set-PSFzfOption -EnableAliasFuzzyScoop

if(Test-Path 'C:\Users\santi\.inshellisense\key-bindings-pwsh.ps1' -PathType Leaf){. C:\Users\santi\.inshellisense\key-bindings-pwsh.ps1}