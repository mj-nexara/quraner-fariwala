function Setup-QuranLab {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\QuranLab"

    $folders = @(
        "$base\Tilawat\RecitationArchive",
        "$base\Tilawat\TajweedAnalysis",
        "$base\Tilawat\VoiceSynthesis\MLModels",
        "$base\Scriptology\CalligraphyStyles\Kufic",
        "$base\Scriptology\CalligraphyStyles\Naskh",
        "$base\Scriptology\CalligraphyStyles\Thuluth",
        "$base\HistoryAndTradition\GlobalTransmission",
        "$base\HistoryAndTradition\CulturalImpact",
        "$base\Research\TafsirComparative",
        "$base\Research\ManuscriptAnalysis\ScanArchive",
        "$base\Research\TranslationStudies\Bangla",
        "$base\Research\TranslationStudies\English",
        "$base\Research\TranslationStudies\Arabic",
        "$base\Research\InterfaithDialogue",
        "$base\PrintingAndPreservation\PressDesigns\CoverTemplates",
        "$base\PrintingAndPreservation\VendorContracts",
        "$base\PrintingAndPreservation\QualityControl",
        "$base\DistributionAndAccess\DistrictWise",
        "$base\DistributionAndAccess\LogisticsPartners",
        "$base\DistributionAndAccess\FeedbackReports",
        "$base\FutureInnovation\DigitalQuran\UIConcepts",
        "$base\FutureInnovation\MobileDistribution",
        "$base\FutureInnovation\InternationalOutreach\EmbassyLetters",
        "$base\FutureInnovation\AI-AssistedTafsir",
        "$base\GovernanceAndEthics"
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
        "$base\Tilawat\README.md",
        "$base\Scriptology\README.md",
        "$base\HistoryAndTradition\README.md",
        "$base\Research\README.md",
        "$base\PrintingAndPreservation\README.md",
        "$base\DistributionAndAccess\README.md",
        "$base\FutureInnovation\README.md",
        "$base\GovernanceAndEthics\README.md"
    )

    foreach ($readme in $readmes) {
        if (-not (Test-Path $readme)) {
            "🛡️ README anchor for $(Split-Path $readme -Leaf) folder." | Out-File -FilePath $readme -Encoding UTF8
            Write-Host "📄 Created README: $readme" -ForegroundColor Cyan
        } else {
            Write-Host "📄 Exists: $readme" -ForegroundColor Gray
        }
    }

    Write-Host "`n✅ QuranLab structure setup complete." -ForegroundColor Magenta
}
