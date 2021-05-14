#!/bin/bash

echo "[INFO] Starting dependent services"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
repoRoot="${SCRIPT_DIR}/../.."

if [[ -z $(docker network ls -q --filter name="eszop-network") ]] ; then
    echo "[WARNING] eszop-network docker network not found. Initializing..."
    docker network create eszop-network
fi

requiredVolumes=(
    "eszop-servicebus-rabbitmq" 
    "eszop-offers-sqlserver" 
    "eszop-identity-sqlserver" 
    "eszop-identity-redis" 
    "eszop-carts-sqlserver" 
    "eszop-orders-sqlserver" 
    "eszop-notification-sqlserver"
)

for volume in ${requiredVolumes[@]}
do
    if [[ -z $(docker volume ls -q -f name="${volume}") ]] ; then
        echo "[WARNING] ${volume} docker volume not found. Initializing..."
        docker volume create $volume
    fi
done

. "${repoRoot}/eszop-backend/bash-scripts/development/local/dependent-services/start_dependent_services.sh"

echo "[INFO] If you start first time dependent services you should apply migrations to databases"
read -p "Do you want to apply migrations to databases? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]] ; then
    echo "TODO: Apply migrations"
fi