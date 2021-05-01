$repo_root = "$PSScriptRoot\..\.."

Push-Location "${repo_root}\eszop-frontend"

$cmds = @"
npm install
Invoke-Expression '`$env:BROWSER=`"none`"'
npm run start-win
"@

Invoke-Expression "cmd /c start pwsh -NoExit -NoProfile -Command {$cmds}"

Pop-Location