function Generate-ProgressReport {
    param (
        [string]$Month,
        [string]$Highlights,
        [string]$Challenges,
        [string]$NextSteps
    )

    $reportPath = "C:\MJ-Ahmad\qf\Docs\Initiative2025\Monitoring\ProgressReports\$Month-Report.md"

    $report = @()
    $report += "# 📊 Monthly Progress Report — $Month"
    $report += "Generated on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $report += "`n---`n"
    $report += "✅ **Highlights:**`n$Highlights`n"
    $report += "⚠️ **Challenges:**`n$Challenges`n"
    $report += "🚀 **Next Steps:**`n$NextSteps`n"
    $report += "`n🛡️ Maintained by MJ Ahmad for Initiative2025"

    $report | Out-File -FilePath $reportPath -Encoding UTF8
    Write-Host "✅ Progress report created for $Month" -ForegroundColor Green
}
