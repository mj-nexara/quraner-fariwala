# ┌────────────────────────────────────────────┐
# │ Log-InvestorInteraction.ps1                │
# │ Ethical • Timestamped • Audit-Ready        │
# └────────────────────────────────────────────┘

function Log-InvestorInteraction {
    param (
        [string]$InvestorName,
        [string]$Date,
        [string]$Mode,
        [string]$Summary,
        [string]$VerifiedBy = "MJ Ahmad"
    )

    $logPath = "C:\mj-ahmad\qf\Docs\Legal\Investors\$InvestorName\CommunicationLog.csv"

    # Ensure log file exists with headers
    if (-not (Test-Path $logPath)) {
        "Date,Mode,Summary,VerifiedBy" | Out-File -FilePath $logPath -Encoding UTF8
    }

    # Format and append entry
    $entry = "$Date,$Mode,$Summary,$VerifiedBy"
    Add-Content -Path $logPath -Value $entry

    Write-Host "✅ Logged interaction for $InvestorName on $Date" -ForegroundColor Green
}
