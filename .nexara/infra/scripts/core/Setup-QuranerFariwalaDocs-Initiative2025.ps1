# ┌────────────────────────────────────────────┐
# │ Setup-QuranerFariwalaDocs-Initiative2025.ps1 │
# │ Ethical • Structured • Inheritable         │
# └────────────────────────────────────────────┘

function Setup-QuranerFariwalaDocs-Initiative2025 {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\Initiative2025"

    $folders = @(
        "$base\Planning",
        "$base\DistrictMobilization",
        "$base\DistrictMobilization\OutreachLetters",
        "$base\MediaCampaign",
        "$base\MediaCampaign\Posters",
        "$base\MediaCampaign\Scripts",
        "$base\LegalSafeguards",
        "$base\LegalSafeguards\PublicStatements",
        "$base\Funding",
        "$base\Monitoring",
        "$base\Monitoring\ProgressReports"
    )

    foreach ($folder in $folders) {
        if (-not (Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder | Out-Null
            Write-Host "📁 Created: $folder" -ForegroundColor Green
        } else {
            Write-Host "✅ Exists: $folder" -ForegroundColor Yellow
        }
    }

    # Create README anchors
    $readmes = @(
        "$base\README.md",
        "$base\Planning\README.md",
        "$base\DistrictMobilization\README.md",
        "$base\MediaCampaign\README.md",
        "$base\LegalSafeguards\README.md",
        "$base\Funding\README.md",
        "$base\Monitoring\README.md"
    )

    foreach ($readme in $readmes) {
        if (-not (Test-Path $readme)) {
            "🛡️ README anchor for $(Split-Path $readme -Leaf) folder." | Out-File -FilePath $readme -Encoding UTF8
            Write-Host "📄 Created README: $readme" -ForegroundColor Cyan
        } else {
            Write-Host "📄 Exists: $readme" -ForegroundColor Gray
        }
    }

    Write-Host "`n✅ Initiative2025 documentation structure setup complete." -ForegroundColor Magenta
}
