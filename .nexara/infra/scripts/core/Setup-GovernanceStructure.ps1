# ┌────────────────────────────────────────────┐
# │ Setup-GovernanceStructure.ps1              │
# │ Ethical • Legal • Proprietorship-Aware     │
# └────────────────────────────────────────────┘

function Setup-GovernanceStructure {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\Governance"

    $folders = @(
        "$base\LegalIdentity",
        "$base\EthicalProtocols",
        "$base\Structure",
        "$base\Transparency"
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
        "$base\LegalIdentity\README.md",
        "$base\EthicalProtocols\README.md",
        "$base\Structure\README.md",
        "$base\Transparency\README.md"
    )

    foreach ($readme in $readmes) {
        if (-not (Test-Path $readme)) {
            "🛡️ README anchor for $(Split-Path $readme -Leaf) folder." | Out-File -FilePath $readme -Encoding UTF8
            Write-Host "📄 Created README: $readme" -ForegroundColor Cyan
        } else {
            Write-Host "📄 Exists: $readme" -ForegroundColor Gray
        }
    }

    Write-Host "`n✅ Governance structure setup complete." -ForegroundColor Magenta
}
