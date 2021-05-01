$backend_tasks_dir = "$PSScriptRoot\Start-Backend-tasks"

& "${backend_tasks_dir}\01-Check-Dependencies.ps1"
& "${backend_tasks_dir}\02-Set-UpDevHostLocal.ps1"
& "${backend_tasks_dir}\03-Start-DependentServices.ps1"
& "${backend_tasks_dir}\04-Start-EszopServices.ps1"