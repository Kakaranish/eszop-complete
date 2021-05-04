$repo_root = "$PSScriptRoot\..\.."

Push-Location "${repo_root}\eszop-backend"
dotnet build

$apps = $(
  "API.Gateway",
  "Carts.API",
  "Identity.API",
  "NotificationService",
  "Offers.API",
  "Orders.API"
)

foreach ($app in $apps) {
  $cmds = @"
Invoke-Expression '`$env:ASPNETCORE_ENVIRONMENT=`"DevHostLocal`"'
Invoke-Expression '`$env:ESZOP_DB_SEED=`"false`"'
Write-Host `"Running $app`"`
dotnet run -p $app --no-build
"@

  Invoke-Expression "cmd /c start pwsh -NoExit -NoProfile -Command {$cmds}"
}

Pop-Location