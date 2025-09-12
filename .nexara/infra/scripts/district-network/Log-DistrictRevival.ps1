function Log-DistrictRevival {
    param (
        [string]$District,
        [string]$Contributor,
        [string]$Role,
        [string]$ContactMode,
        [string]$Status,
        [string]$VerifiedBy = "MJ Ahmad"
    )

    $logPath = "C:\quraner-fariwala\quraner-fariwala\Docs\Initiative2025\DistrictMobilization\RevivalLogs.csv"

    if (-not (Test-Path $logPath)) {
        "Timestamp,District,Contributor,Role,ContactMode,Status,VerifiedBy" | Out-File $logPath -Encoding UTF8
    }

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp,$District,$Contributor,$Role,$ContactMode,$Status,$VerifiedBy" | Add-Content $logPath

    Write-Host "✅ Revival logged for $Contributor in $District" -ForegroundColor Green
}
