npm -v | Out-Null
if($LASTEXITCODE) {
  Write-Warning "Missing 'npm'"
}