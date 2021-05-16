#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
repo_root="${SCRIPT_DIR}/../.."

pushd "$repo_root/eszop-backend" > /dev/null

dotnet build

apps=(
  "API.Gateway"
  "Carts.API"
  "Identity.API"
  "NotificationService"
  "Offers.API"
  "Orders.API"
)

for app in ${apps[@]} 
do
  commands="ASPNETCORE_ENVIRONMENT=DevHostLocal ; \
  ESZOP_DB_SEED=false ; \
  echo 'Running ${app}' ; \
  dotnet run -p ${app} --no-build"

  gnome-terminal -- /bin/sh -c "$commands"
done

popd > /dev/null