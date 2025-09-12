# ┌────────────────────────────────────────────┐
# │ Log-FyjaMedical.ps1                        │
# │ Dignity • Timestamped • Audit-Ready        │
# └────────────────────────────────────────────┘

function Log-FyjaMedical {
    param (
        [string]$Date,
        [string]$Hospital,
        [string]$Doctor,
        [string]$Diagnosis,
        [string]$Treatment,
        [string]$Cost,
        [string]$VerifiedBy = "MJ Ahmad"
    )

    $logPath = "C:\quraner-fariwala\quraner-fariwala\docs\fyja-legacy\Docs\MedicalLog.csv"

    # Ensure log file exists with headers
    if (-not (Test-Path $logPath)) {
        "Date,Hospital,Doctor,Diagnosis,Treatment,Cost,VerifiedBy" | Out-File -FilePath $logPath -Encoding UTF8
    }

    # Format and append entry
    $entry = "$Date,$Hospital,$Doctor,$Diagnosis,$Treatment,$Cost,$VerifiedBy"
    Add-Content -Path $logPath -Value $entry

    Write-Host "✅ Written medical entry for Fyja on $Date" -ForegroundColor Green
}
