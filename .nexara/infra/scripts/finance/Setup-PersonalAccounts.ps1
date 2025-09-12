# ┌────────────────────────────────────────────┐
# │ Setup-PersonalAccounts.ps1                 │
# │ Ethical • Transparent • Audit-Ready        │
# └────────────────────────────────────────────┘

function Setup-PersonalAccounts {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\Finance\Accounts\PersonalAccounts"

    $folders = @(
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

    # Personal account files
    $accounts = @(
        @{ File = "CityBank.md"; Bank = "City Bank"; Branch = "Motijheel"; Account = "2803485890001" },
        @{ File = "BRAC.md"; Bank = "BRAC Bank"; Branch = "Bijoynagar"; Account = "1058614360001" },
        @{ File = "PrimeBank.md"; Bank = "Prime Bank"; Branch = "Wari"; Account = "2187211009619" }
    )

    foreach ($acc in $accounts) {
        $path = Join-Path $base $acc.File
        $content = @"
# 🏦 $($acc.Bank) — Personal Account

**Account Holder**: Md Jafor Ahmad  
**Account Number**: $($acc.Account)  
**Branch**: $($acc.Branch)  
**Status**: Active  
**Purpose**: Personal use only  
**Verified By**: MJ Ahmad  
**Last Audit**: [Insert Date]

## 🛡️ Ethical Notes
- Never used for Quraner Fariwala operations.
- Publicly declared for transparency and protection.
- Linked to AuditAnchors for verification.

## 🕊️ MJ’s Statement
“$($acc.Bank)-এর এই একাউন্ট আমার ব্যক্তিগত, কিন্তু আমার নৈতিকতার বাইরে নয়। আমি যা লুকাই না, তা কেউ অপব্যবহার করতে পারে না।”
"@

        $content | Out-File -FilePath $path -Encoding UTF8
        Write-Host "📄 Created: $($acc.File)" -ForegroundColor Cyan
    }

    Write-Host "`n✅ Personal account structure setup complete." -ForegroundColor Magenta
}