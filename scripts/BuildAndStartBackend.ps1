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
  invoke-expression "cmd /c start pwsh -Command { dotnet run -p $app --no-build }"
}

Pop-Location