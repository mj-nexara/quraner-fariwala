function Setup-FinanceStructure {
    $root = "C:\quraner-fariwala\quraner-fariwala\Docs\Finance"

    $folders = @(
        "$root",
        "$root\dao\proposals",
        "$root\dao\votes",
        "$root\dao\roles",
        "$root\chain\contracts",
        "$root\chain\logs",
        "$root\chain\scripts",
        "$root\bridge\adapters",
        "$root\bridge\verification",
        "$root\bridge\fallback",
        "$root\backend\models",
        "$root\backend\routes",
        "$root\backend\middleware",
        "$root\frontend\components",
        "$root\frontend\pages",
        "$root\frontend\styles",
        "$root\scripts",
        "$root\docs"
    )

    foreach ($folder in $folders) {
        if (-not (Test-Path $folder)) {
            New-Item -ItemType Directory -Path $folder | Out-Null
            Write-Host "📁 Created: $folder" -ForegroundColor Green
        } else {
            Write-Host "🔁 Exists: $folder" -ForegroundColor Yellow
        }
    }

    $readmes = @{
        "dao" = "Empowers contributors to govern with dignity."
        "chain" = "Logs every transaction as a blockchain legacy."
        "bridge" = "Connects external gateways with ethical verification."
        "backend" = "Handles secure API for transactions and roles."
        "frontend" = "Displays contributor wallets, votes, and logs."
        "scripts" = "PowerShell/Node scripts for onboarding and logging."
        "docs" = "Public documentation for inheritance and clarity."
    }

    foreach ($key in $readmes.Keys) {
        $readmePath = "$root\$key\README.md"
        $content = "# $key`n`n$($readmes[$key])"
        Set-Content -Path $readmePath -Value $content
        Write-Host "📝 README.md created for $key" -ForegroundColor Cyan
    }

    Write-Host "`n✅ NXN-GENESIS structure created with README anchors." -ForegroundColor Magenta
}
