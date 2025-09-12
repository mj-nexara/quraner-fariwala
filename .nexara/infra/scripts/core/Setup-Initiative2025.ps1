function Setup-Initiative2025 {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\Initiative2025"

    $folders = @(
        "$base\Planning",
        "$base\DistrictMobilization\OutreachLetters",
        "$base\MediaCampaign\Posters",
        "$base\MediaCampaign\Scripts",
        "$base\LegalSafeguards\PublicStatements",
        "$base\Funding",
        "$base\Monitoring\ProgressReports"
    )

    $readmes = @{
        "Planning" = "Outlines strategic goals, timelines, and ethical priorities for Initiative2025."
        "DistrictMobilization\OutreachLetters" = "Contains outreach templates for district-level engagement."
        "MediaCampaign\Posters" = "Visual assets for public awareness and ethical messaging."
        "MediaCampaign\Scripts" = "Approved scripts for media broadcasts and contributor briefings."
        "LegalSafeguards\PublicStatements" = "Public-facing legal declarations and ethical safeguards."
        "Funding" = "Tracks financial sources, allocations, and transparency logs."
        "Monitoring\ProgressReports" = "Documents progress, impact metrics, and contributor feedback."
    }

    foreach ($folder in $folders) {
        if (-not (Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder | Out-Null
            Write-Host "📁 Created: $folder" -ForegroundColor Green
        } else {
            Write-Host "✅ Exists: $folder" -ForegroundColor Yellow
        }

        # Create README.md with semantic description
        $relativePath = $folder.Replace("$base\", "")
        if ($readmes.ContainsKey($relativePath)) {
            $readmePath = "$folder\README.md"
            $content = "# $relativePath`n`n$($readmes[$relativePath])"
            Set-Content -Path $readmePath -Value $content
            Write-Host "📝 README.md created for $relativePath" -ForegroundColor Cyan
        }
    }

    Write-Host "`n✅ Initiative2025 folder structure and README anchors complete." -ForegroundColor Magenta
}
