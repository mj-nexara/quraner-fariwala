# ┌────────────────────────────────────────────┐
# │ Generate-IncidentDigest.ps1                │
# │ Truth Summary • Timestamped • Ethical      │
# └────────────────────────────────────────────┘

function Generate-IncidentDigest {
    param (
        [string]$Name
    )

    $basePath   = "C:\quraner-fariwala\quraner-fariwala\Docs\Legal\Conspirators\$Name"
    $timeline   = "$basePath\Timeline.csv"
    $digestPath = "$basePath\IncidentDigest.txt"

if (!(Test-Path $timelinePath)) {
    Write-Host "❌ Timeline.csv not found at $timelinePath" -ForegroundColor Red
    Write-Host "📎 Please ensure incident data is available before generating digest." -ForegroundColor Magenta
    exit 1
}


    $digest = @()
    $digest += "🧠 Incident Digest — $Name"
    $digest += "Generated on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $digest += "`n---`n"

    $entries = Import-Csv -Path $timeline
    foreach ($entry in $entries) {
        $digest += "$($entry.Date) [$($entry.Mode)]: $($entry.Action) → Impact: $($entry.Impact)"
    }

    $digest += "`n🛡️ Ethical Note:`nThis digest is prepared for lawful review and institutional defense. Quraner Fariwala does not retaliate—only documents and defends."

    $digest | Out-File -FilePath $digestPath -Encoding UTF8
    Write-Host "✅ IncidentDigest.txt created for $Name" -ForegroundColor Green
}