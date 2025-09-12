<#
.SYNOPSIS
  Diagnoses Git push failures due to large payloads, network instability, or misconfigured remotes.

.DESCRIPTION
  This script checks Git buffer settings, compression, protocol version, and remote transport.
  Designed for MJ DevKit contributors pushing large commits or assets.

.NOTES
  Author: MJ Ahmad
  Version: 1.0.0
  Tags: Git, Push, Diagnostics, MJ DevKit
#>

Write-Host "`n🔍 MJ DevKit: Starting Git push diagnostics..." -ForegroundColor Cyan

# Step 1: Check Git buffer size
$buffer = git config --global http.postBuffer
if ($buffer -ge 524288000) {
    Write-Host "✅ http.postBuffer is optimized ($buffer bytes)." -ForegroundColor Green
} else {
    Write-Host "⚠️ http.postBuffer is low ($buffer). Recommend setting to 524288000." -ForegroundColor Yellow
}

# Step 2: Check compression
$compression = git config --global core.compression
if ($compression -eq "0") {
    Write-Host "✅ core.compression is disabled for large pushes." -ForegroundColor Green
} else {
    Write-Host "⚠️ core.compression is enabled ($compression). May slow down large pushes." -ForegroundColor Yellow
}

# Step 3: Check HTTP version
$httpVersion = git config --global http.version
if ($httpVersion -eq "HTTP/1.1") {
    Write-Host "✅ http.version is set to HTTP/1.1 (proxy-safe)." -ForegroundColor Green
} else {
    Write-Host "⚠️ http.version is $httpVersion. Consider switching to HTTP/1.1." -ForegroundColor Yellow
}

# Step 4: Check remote protocol
$remoteUrl = git remote get-url origin
if ($remoteUrl -like "https://*") {
    Write-Host "🌐 Remote is using HTTPS." -ForegroundColor Yellow
    Write-Host "💡 Consider switching to SSH for more stable large pushes:" -ForegroundColor DarkYellow
    Write-Host "    git remote set-url origin git@github.com:mj-nexara/qf.git" -ForegroundColor Gray
} elseif ($remoteUrl -like "git@*") {
    Write-Host "✅ Remote is using SSH." -ForegroundColor Green
} else {
    Write-Host "⚠️ Remote URL format unrecognized: $remoteUrl" -ForegroundColor Red
}

# Step 5: Optional network ping
Write-Host "`n📡 Pinging GitHub..." -ForegroundColor Cyan
Test-Connection github.com -Count 2 | ForEach-Object {
    Write-Host "  ↪ Response from $($_.Address): $($_.ResponseTime)ms"
}

Write-Host "`n✅ MJ DevKit: Git diagnostics complete." -ForegroundColor Green
