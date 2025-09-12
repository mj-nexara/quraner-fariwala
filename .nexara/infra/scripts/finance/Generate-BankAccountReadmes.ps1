# ┌────────────────────────────────────────────┐
# │ Generate-BankAccountReadmes.ps1            │
# │ Semantic • Ethical • Audit-Ready           │
# └────────────────────────────────────────────┘

function Generate-BankAccountReadmes {
    $base = "C:\quraner-fariwala\quraner-fariwala\Docs\Finance\Accounts\BankAccounts"

    $accounts = @(
        @{
            File = "CityBank.md"
            Bank = "City Bank"
            Branch = "Motijheel"
            Account = "1502835465001"
            Routing = "225271548"
            Statement = "City Bank-এর এই একাউন্ট আমার দণ্ডের একটি দলিল। আমি যা গ্রহণ করেছি, তা উৎসর্গ করেছি। আমি যা ব্যয় করেছি, তা প্রমাণ করেছি।"
        },
        @{
            File = "MTB.md"
            Bank = "Mutual Trust Bank (MTB)"
            Branch = "Principal"
            Account = "1301010000896"
            Routing = "145275358"
            Statement = "MTB-এর এই একাউন্ট আমার CLI-এর একটি নৈতিক পোর্ট। প্রতিটি লেনদেন একটি স্মারক।"
        },
        @{
            File = "EBL.md"
            Bank = "Eastern Bank Limited (EBL)"
            Branch = "Principal"
            Account = "1011070611663"
            Routing = "095275358"
            Statement = "EBL-এর এই একাউন্ট আমার গবেষণার ছাপ। প্রতিটি ব্যাচ, প্রতিটি বিতরণ, একটি দলিল।"
        },
        @{
            File = "BRAC.md"
            Bank = "BRAC Bank"
            Branch = "Bijoynagar"
            Account = "2060133490001"
            Routing = "060271103"
            Statement = "BRAC-এর এই একাউন্ট আমার জেলা ভিত্তিক পুনর্জাগরণের বাহন। প্রতিটি পুনঃসংযোগ একটি উত্তরাধিকার।"
        }
    )

    foreach ($acc in $accounts) {
        $path = Join-Path $base $acc.File
        $content = @"
# 🏦 $($acc.Bank) — Quraner Fariwala

**Account Name**: QURANER FARIWALA  
**Account Number**: $($acc.Account)  
**Branch**: $($acc.Branch)  
**Routing Number**: $($acc.Routing)  
**Account Type**: Proprietorship Current Account  
**Status**: Active  
**Verified By**: MJ Ahmad  
**Last Audit**: [Insert Date]

## 🛡️ Ethical Notes
- Used solely for Quraner Fariwala’s institutional operations.
- No personal transactions permitted.
- All contributions are logged and acknowledged.

## 📘 Linked Documents
- TradeLicense.pdf  
- RoutingInfo.csv  
- ContributionAgreements\$($acc.Bank.Split()[0])-Investors.md  
- ExpenseLog.csv (filtered by $($acc.Bank.Split()[0]))

## 🕊️ MJ’s Statement
“$($acc.Statement)”
"@

        $content | Out-File -FilePath $path -Encoding UTF8
        Write-Host "📄 Created README: $($acc.File)" -ForegroundColor Cyan
    }

    Write-Host "`n✅ All bank account README files generated." -ForegroundColor Magenta
}