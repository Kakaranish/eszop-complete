$repo_root = "$PSScriptRoot\..\.."

$img_storage_path = (Resolve-Path -Path "${repo_root}\eszop-frontend\public\wwwroot").Path

$offers_launch_json_path = "${repo_root}\eszop-backend\Offers.API\Properties\launchSettings.json"
$offers_launch_json = Get-Content -Path $offers_launch_json_path | ConvertFrom-Json -Depth 9
$offers_launch_json.profiles.'Offers.API'.environmentVariables.ESZOP_LOCAL_BLOB_STORAGE_WWWROOT_DIR = $img_storage_path
$offers_launch_json | ConvertTo-Json -Depth 9 | Set-Content $offers_launch_json_path

$offers_appsettings_path = "${repo_root}\eszop-backend\Offers.API\appsettings.DevHostLocal.json"
$offers_appsettings_json = Get-Content -Path $offers_appsettings_path | ConvertFrom-Json -Depth 9
$offers_appsettings_json.LocalBlobStorageWwwRootDir = $img_storage_path
$offers_appsettings_json | ConvertTo-Json -Depth 9 | Set-Content $offers_appsettings_path