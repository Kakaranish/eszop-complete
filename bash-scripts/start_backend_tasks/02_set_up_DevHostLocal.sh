#!/bin/bash

echo "[INFO] Setting up DevHostLocal"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
repoRoot="${SCRIPT_DIR}/../.."
imgStoragePath=$(readlink -f "${repoRoot}/eszop-backend/Offers.API/Properties/launchSettings.json")

offersLaunchJsonPath="${repoRoot}/eszop-backend/Offers.API/Properties/launchSettings.json"
cat $offersLaunchJsonPath | \
    jq ".profiles.\"Offers.API\".environmentVariables.ESZOP_LOCAL_BLOB_STORAGE_WWWROOT_DIR=\"${imgStoragePath}\"" \
    > "$offersLaunchJsonPath.temp"
cp -f "$offersLaunchJsonPath.temp" $offersLaunchJsonPath && rm "$offersLaunchJsonPath.temp"

appSettingsPath=$(readlink -f "${repoRoot}/eszop-backend/Offers.API/appsettings.DevHostLocal.json")
cat $appSettingsPath | \
    jq ".LocalBlobStorageWwwRootDir=\"${imgStoragePath}\"" \
    > "$appSettingsPath.temp"
cp -f "$appSettingsPath.temp" $appSettingsPath && rm "$appSettingsPath.temp"