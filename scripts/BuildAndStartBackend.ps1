Push-Location "$PSScriptRoot\..\eszop-backend"
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
dotnet run -p $app --no-build
"@

  Invoke-Expression "cmd /c start pwsh -noexit -command {$cmds}"
}

Pop-Location