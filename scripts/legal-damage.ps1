# Setup script for 01_legal-damage structure
$basePath = "legal-damage\hamidullah"

# Define folder structure
$folders = @(
    "$basePath\01_profile",
    "$basePath\02_incident-details\scanned-proof",
    "$basePath\03_legal-action\filed-documents",
    "$basePath\04_international-submission",
    "$basePath\05_internal-archive"
)

# Define files to create
$files = @(
    "$basePath\01_profile\identity.md",
    "$basePath\01_profile\relationship-to-org.md",
    "$basePath\01_profile\metadata.yml",

    "$basePath\02_incident-details\timeline.md",
    "$basePath\02_incident-details\evidence-list.md",
    "$basePath\02_incident-details\scanned-proof\audio-transcript.pdf",
    "$basePath\02_incident-details\scanned-proof\screenshot1.png",
    "$basePath\02_incident-details\scanned-proof\affidavit-copy.pdf",

    "$basePath\03_legal-action\case-summary.md",
    "$basePath\03_legal-action\filed-documents\FIR.pdf",
    "$basePath\03_legal-action\filed-documents\court-submission.pdf",
    "$basePath\03_legal-action\filed-documents\lawyer-notes.md",

    "$basePath\04_international-submission\UN-complaint-draft.md",
    "$basePath\04_international-submission\NGO-briefing.md",
    "$basePath\04_international-submission\translated-summary_en.md",

    "$basePath\05_internal-archive\impact-on-org.md",
    "$basePath\05_internal-archive\recovery-plan.md",
    "$basePath\05_internal-archive\contributor-notice.md",

    "$basePath\README.md"
)

# Create folders
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
    }
}

# Create empty files
foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        New-Item -ItemType File -Path $file -Force | Out-Null
    }
}

Write-Host "✅ Structure created successfully under '$basePath'"
