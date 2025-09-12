# ┌────────────────────────────────────────────┐
# │ Generate-DistrictBrief.ps1                 │
# │ District Legacy • Ethical • Timestamped    │
# └────────────────────────────────────────────┘

function Generate-DistrictBrief {
    param (
        [string]$DistrictName
    )

    $basePath     = "C:\quraner-fariwala\quraner-fariwala\Docs\Legacy\DistrictNetwork\$DistrictName"
    $contributors = "$basePath\Contributors.md"
    $stats        = "$basePath\DistributionStats.csv"
    $testimonials = "$basePath\Testimonials.txt"
    $briefPath    = "$basePath\DistrictBrief.txt"

    $brief = @()
    $brief += "🌾 District Brief — $DistrictName"
    $brief += "Generated on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $brief += "`n---`n"

    # Contributor Summary
    if (Test-Path $contributors) {
        $names = Get-Content $contributors | Select-String -Pattern '^\- ' | ForEach-Object { $_.Line }
        $brief += "🧑‍🏫 Contributors:`n" + ($names -join "`n") + "`n"
    } else {
        $brief += "🧑‍🏫 Contributors: ❌ Not Found`n"
    }

    # Distribution Stats
    if (Test-Path $stats) {
        $data = Import-Csv $stats
        $total = ($data | Measure-Object).Count
        $brief += "📦 Distribution Summary:`nTotal Records: $total`n"
        foreach ($row in $data) {
            $brief += "- School: $($row.School), Qurans: $($row.QuransDelivered)"
        }
        $brief += "`n"
    } else {
        $brief += "📦 Distribution Summary: ❌ Not Found`n"
    }

    # Testimonials
    if (Test-Path $testimonials) {
        $quotes = Get-Content $testimonials | Where-Object { $_ -match '^>' }
        $brief += "🗣️ Testimonials:`n" + ($quotes -join "`n") + "`n"
    } else {
        $brief += "🗣️ Testimonials: ❌ Not Found`n"
    }

    # Ethical Note
    $brief += "`n🛡️ Ethical Statement:`nThis brief honors the contributors of $DistrictName for their role in Quraner Fariwala’s legacy. All data is preserved for revival, recognition, and future collaboration."

    # Save brief
    $brief | Out-File -FilePath $briefPath -Encoding UTF8
    Write-Host "✅ DistrictBrief.txt created for $DistrictName" -ForegroundColor Green
}
