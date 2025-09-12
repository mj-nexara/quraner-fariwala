# ┌────────────────────────────────────────────┐
# │ Log-Conspirator.ps1                        │
# │ Ethical • Timestamped • Audit-Ready        │
# └────────────────────────────────────────────┘

function Log-Conspirator {
    param (
        [string]$Name,
        [string]$Date,
        [string]$Mode,
        [string]$Action,
        [string]$Impact,
        [string]$VerifiedBy = "MJ Ahmad"
    )

    $logPath = "C:\quraner-fariwala\quraner-fariwala\Docs\Legal\Conspirators\$Name\Timeline.csv"

    # Ensure log file exists with headers
    if (-not (Test-Path $logPath)) {
        "Date,Mode,Action,Impact,VerifiedBy" | Out-File -FilePath $logPath -Encoding UTF8
    }

    # Format and append entry
    $entry = "$Date,$Mode,$Action,$Impact,$VerifiedBy"
    Add-Content -Path $logPath -Value $entry

    Write-Host "✅ Logged incident for $Name on $Date" -ForegroundColor Green
}
