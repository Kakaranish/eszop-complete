$repo_root = "$PSScriptRoot\..\.."

if (-not(@(docker network ls --filter name="eszop-network")[1])) {
  Write-Warning "eszop-network docker network not found. Initializing..."
  docker network create eszop-network
}

$required_volumes = @(
  "eszop-servicebus-rabbitmq",
  "eszop-offers-sqlserver",
  "eszop-identity-sqlserver",
  "eszop-identity-redis",
  "eszop-carts-sqlserver",
  "eszop-orders-sqlserver",
  "eszop-notification-sqlserver"
)

foreach ($volume_name in $required_volumes) {
  $result = @(docker volume ls -f name="${volume_name}")[1]
  if (-not($result)) {
    Write-Warning "${volume_name} docker volume not found. Initializing..."
    docker volume create $volume_name
  }
}

& "${repo_root}\eszop-backend\scripts\development\local\dependent-services\Start-DependentServices.ps1"

Write-Host "[INFO] If you start first time dependent services you should apply migrations to databases" -ForegroundColor Green
$reply = Read-Host -Prompt "Do you want to apply migrations to databases? [y/n]"
if ($reply -match "[yY]") { 
  & "${repo_root}\eszop-backend\scripts\db-scripts\Apply-DbMigrations.ps1" -Local
}