# ┌────────────────────────────────────────────┐
# │ Setup-FinanceAccounts.ps1                  │
# │ Ethical • Structured • Audit-Ready         │
# └────────────────────────────────────────────┘

function Setup-FinanceAccounts {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\Finance\Accounts"

    $folders = @(
        "$base\BankAccounts",
        "$base\MobilePayments",
        "$base\PaymentLinks",
        "$base\AuditAnchors"
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
        "$base\BankAccounts\README.md",
        "$base\MobilePayments\README.md",
        "$base\AuditAnchors\README.md"
    )

    foreach ($readme in $readmes) {
        if (-not (Test-Path $readme)) {
            "🛡️ README anchor for $(Split-Path $readme -Leaf) folder." | Out-File -FilePath $readme -Encoding UTF8
            Write-Host "📄 Created README: $readme" -ForegroundColor Cyan
        } else {
            Write-Host "📄 Exists: $readme" -ForegroundColor Gray
        }
    }

    # RoutingInfo.csv placeholder
    $routingFile = "$base\RoutingInfo.csv"
    if (-not (Test-Path $routingFile)) {
        "Bank,Branch,RoutingNumber" | Out-File -FilePath $routingFile -Encoding UTF8
        Write-Host "📄 Created: RoutingInfo.csv" -ForegroundColor Cyan
    } else {
        Write-Host "📄 Exists: RoutingInfo.csv" -ForegroundColor Gray
    }

    Write-Host "`n✅ Finance Accounts structure setup complete." -ForegroundColor Magenta
}