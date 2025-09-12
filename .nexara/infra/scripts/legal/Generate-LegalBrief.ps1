# ┌────────────────────────────────────────────┐
# │ Generate-LegalBrief.ps1                    │
# │ Lawyer-Ready • Timestamped • Ethical       │
# └────────────────────────────────────────────┘

function Generate-LegalBrief {
    param (
        [string]$InvestorName
    )

    $basePath     = "C:\mj-ahmad\qf\Docs\Legal\Investors\$InvestorName"
    $profilePath  = "$basePath\Profile.md"
    $statusPath   = "$basePath\Status.md"
    $incidentPath = "$basePath\IncidentReport.md"
    $agreement    = Get-ChildItem $basePath -Include *.pdf -File | Where-Object { $_.Name -like "*Agreement*" } | Select-Object -First 1
    $cheque       = Get-ChildItem "$basePath\BankProof" -Include *.jpg, *.png, *.pdf -File | Select-Object -First 1
    $briefPath    = "$basePath\LegalBrief.txt"

    $brief = @()
    $brief += "⚖️ Legal Brief — $InvestorName"
    $brief += "Generated on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $brief += "`n---`n"

    # Profile Summary
    if (Test-Path $profilePath) {
        $profile = Get-Content $profilePath | Select-String -Pattern '^\- \*\*.*' | ForEach-Object { $_.Line }
        $brief += "📌 Profile Summary:`n" + ($profile -join "`n") + "`n"
    }

    # Agreement Reference
    if ($agreement) {
        $brief += "📜 Agreement File: $($agreement.Name)"
    } else {
        $brief += "📜 Agreement File: ❌ Not Found"
    }

    # Cheque Reference
    if ($cheque) {
        $brief += "🏦 Cheque Proof: $($cheque.Name)"
    } else {
        $brief += "🏦 Cheque Proof: ❌ Not Found"
    }

    # Status Summary
    if (Test-Path $statusPath) {
        $status = Get-Content $statusPath | Select-String -Pattern '^\- \*\*.*' | ForEach-Object { $_.Line }
        $brief += "`n📌 Legal Status:`n" + ($status -join "`n")
    }

    # Incident Summary
    if (Test-Path $incidentPath) {
        $incidents = Get-Content $incidentPath | Where-Object { $_ -match '^\| \d{4}-\d{2}-\d{2}' }
        $brief += "`n⚠️ Incident Timeline:`n" + ($incidents -join "`n")
    }

    # Ethical Note
    $brief += "`n🛡️ Ethical Statement:`n"
    $brief += "No investor rights have been revoked. All documentation is preserved for lawful resolution. Quraner Fariwala remains committed to transparency and dignity."

    # Save Brief
    $brief | Out-File -FilePath $briefPath -Encoding UTF8
    Write-Host "✅ LegalBrief.txt created for $InvestorName" -ForegroundColor Green
}
