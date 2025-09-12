# ┌────────────────────────────────────────────┐
# │ Setup-UIFolderStructure.ps1                │
# │ Ethical • Modular • UI Planning            │
# └────────────────────────────────────────────┘

function Setup-UIFolderStructure {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\UI"

    $folders = @(
        "$base\Components\Header",
        "$base\Components\Footer",
        "$base\Pages\Home",
        "$base\Pages\About",
        "$base\Pages\QuranLab",
        "$base\Pages\DistrictNetwork",
        "$base\Pages\LegalEthics",
        "$base\Pages\Transparency",
        "$base\Pages\JoinMission",
        "$base\Pages\Contact",
        "$base\Pages\AdminPortal",
        "$base\Assets\Images",
        "$base\Assets\Icons",
        "$base\Assets\Fonts",
        "$base\Blueprints"
    )

    foreach ($folder in $folders) {
        if (-not (Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder | Out-Null
            Write-Host "📁 Created: $folder" -ForegroundColor Green
        } else {
            Write-Host "✅ Exists: $folder" -ForegroundColor Yellow
        }
    }

    # README anchors
    $readmes = @(
        "$base\README.md",
        "$base\Components\Header\README.md",
        "$base\Components\Footer\README.md",
        "$base\Pages\README.md",
        "$base\Assets\README.md",
        "$base\Blueprints\README.md"
    )

    foreach ($readme in $readmes) {
        if (-not (Test-Path $readme)) {
            "🛡️ README anchor for $(Split-Path $readme -Leaf) folder." | Out-File -FilePath $readme -Encoding UTF8
            Write-Host "📄 Created README: $readme" -ForegroundColor Cyan
        } else {
            Write-Host "📄 Exists: $readme" -ForegroundColor Gray
        }
    }

    Write-Host "`n✅ UI folder structure setup complete." -ForegroundColor Magenta
}
