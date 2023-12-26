# Aliases
New-Alias -Name touch -Value New-Item

# Alias for pnpm dlx command
function pnpx {
    $joinedArgs = $args -join " "
    pnpm exec $joinedArgs
}