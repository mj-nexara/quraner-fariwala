# ┌────────────────────────────────────────────┐
# │ Log-ContributorRevival.ps1                 │
# │ District Revival • Timestamped • Ethical   │
# └────────────────────────────────────────────┘

function Write-ContributorRevival {
    param (
        [string]$District,
        [string]$Name,
        [string]$Role,
        [string]$ContactMode,
        [string]$Status,
        [string]$VerifiedBy = "MJ Ahmad"
    )

    $logPath = "C:\quraner-fariwala\quraner-fariwala\Network\DistrictRegistry.csv"

    # Ensure log file exists with headers
    if (-not (Test-Path $logPath)) {
        "Timestamp,District,Name,Role,ContactMode,Status,VerifiedBy" | Out-File -FilePath $logPath -Encoding UTF8
    }

    # Format and append entry
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "$timestamp,$District,$Name,$Role,$ContactMode,$Status,$VerifiedBy"
    Add-Content -Path $logPath -Value $entry

    Write-Host "✅ Logged revival for $Name in $District" -ForegroundColor Green
}
