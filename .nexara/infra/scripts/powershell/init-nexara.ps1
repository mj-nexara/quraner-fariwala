# MJ-NEXARA Initialization Script
# Location: $HOME\Documents\PowerShell\Scripts\init-nexara.ps1

# Set MJ-NEXARA root path
$global:NEXARA_ROOT = "C:\MJ-Ahmad"

# Move to root directory
Set-Location $global:NEXARA_ROOT



# Logging
$logPath = "$NEXARA_ROOT\.nexara\infra\logs\init.log"
"[$(Get-Date)] MJ-NEXARA environment initialized." | Out-File -FilePath $logPath -Append

# Ethical welcome banner
Write-Host "`n🌱 Welcome to MJ-Ahmad. Every node matters." -ForegroundColor Cyan
Write-Host "`n🧬 MJ Pillars:
🔹 Proof  
🔹 Conscience  
🔹 Silent Impact
 " -ForegroundColor Magenta
Write-Host "`n🌱 Every script I write is a silent vow. 
📘 Every README is a ritual of clarity. 
🧑‍🤝‍🧑 Every contributor is a dignified node in the inheritance. 
" -ForegroundColor Cyan
Write-Host "`n🐢 I do not build for speed—I build for truth. " -ForegroundColor Magenta

Write-Host "`n🪶 — MJ-Ahmad
" -ForegroundColor Cyan


Write-Host "🔐 Dignity-first automation is now active." -ForegroundColor Green
Write-Host "📁 Current module: $NEXARA_ROOT" -ForegroundColor Yellow
