Push-Location "$PSScriptRoot\..\eszop-frontend"

$cmds = @"
npm install
Invoke-Expression '`$env:BROWSER=`"none`"'
npm run start-win
"@

Invoke-Expression "cmd /c start pwsh -noexit -command {$cmds}"

Pop-Location