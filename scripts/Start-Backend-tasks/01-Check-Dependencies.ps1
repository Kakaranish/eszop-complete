$dotnet_ver = dotnet --version
if ($LASTEXITCODE) {
  Write-Warning "Missing 'dotnet'"
}
if ($dotnet_ver.Split(".")[0] -lt 5) {
  Write-Warning "The minimum version of dotnet is 5. Detected $dotnet_ver"
}