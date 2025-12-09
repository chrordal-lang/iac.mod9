Write-Host "=== Terraform fmt ==="
terraform fmt -check
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "=== Terraform validate ==="
terraform validate
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "=== TFLint init ==="
tflint --init
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "=== TFLint scan ==="
tflint
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "=== Checkov scan ==="
checkov -d . --framework terraform --compact
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host "=== All validation checks passed ==="
