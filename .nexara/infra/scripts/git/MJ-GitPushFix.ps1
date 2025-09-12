<#
.SYNOPSIS
  Applies Git configuration fixes for large push failures.

.DESCRIPTION
  This script sets recommended Git settings to improve reliability when pushing large commits.
  Designed for MJ DevKit contributors working with heavy assets or monorepos.

.NOTES
  Author: MJ Ahmad
  Version: 1.0.0
  Tags: Git, Push, Fix, MJ DevKit
#>

Write-Host "`n🛠️ MJ DevKit: Applying Git push optimizations..." -ForegroundColor Cyan

# Step 1: Increase HTTP buffer size
git config --global http.postBuffer 524288000
Write-Host "✅ http.postBuffer set to 524288000 (500 MB)" -ForegroundColor Green

# Step 2: Disable compression
git config --global core.compression 0
Write-Host "✅ core.compression disabled" -ForegroundColor Green

# Step 3: Force HTTP/1.1 for proxy compatibility
git config --global http.version HTTP/1.1
Write-Host "✅ http.version set to HTTP/1.1" -ForegroundColor Green

# Step 4: Display current remote URL
$remoteUrl = git remote get-url origin
Write-Host "`n🌐 Current remote URL: $remoteUrl" -ForegroundColor Yellow

# Step 5: Recommend SSH if using HTTPS
if ($remoteUrl -like "https://*") {
    Write-Host "💡 Consider switching to SSH for more stable large pushes:" -ForegroundColor DarkYellow
    Write-Host "    git remote set-url origin git@github.com:mj-nexara/qf.git" -ForegroundColor Gray
}

Write-Host "`n✅ MJ DevKit: Git push configuration updated." -ForegroundColor Green
