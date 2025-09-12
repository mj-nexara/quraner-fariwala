function Generate-WarningBanner {
    param (
        [string]$Language = "Bangla"
    )

    $bannerText = switch ($Language) {
        "Bangla" { "⚠️ সতর্কবার্তা: এই প্ল্যাটফর্মে সকল তথ্য যাচাইযোগ্য ও নৈতিকভাবে সংরক্ষিত।" }
        "English" { "⚠️ Warning: All data on this platform is verifiable and ethically preserved." }
        "Arabic" { "⚠️ تحذير: جميع البيانات على هذا المنصة موثوقة ومحفوظة أخلاقياً." }
        default { "⚠️ Language not supported." }
    }

    $bannerPath = "C:\mj-ahmad\qf\docs\warning_$Language.txt"
    Set-Content -Path $bannerPath -Value $bannerText
    Write-Host "Generated warning banner in $Language"
}
