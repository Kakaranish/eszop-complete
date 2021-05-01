$frontend_tasks_dir = "$PSScriptRoot\Start-Frontend-tasks"

& "${frontend_tasks_dir}\01-Check-Dependencies.ps1"
& "${frontend_tasks_dir}\02-Start-EszopFrontendService.ps1"