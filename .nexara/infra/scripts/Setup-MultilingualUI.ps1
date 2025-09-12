function Setup-MultilingualUI {
    $languages = @("Bangla", "English", "Arabic")
    $uiPath = "C:\mj-ahmad\qf\docs\ui"

    foreach ($lang in $languages) {
        $file = Join-Path $uiPath "ui_$lang.txt"
        if (-not (Test-Path $file)) {
            New-Item -Path $file -ItemType File | Out-Null
            Add-Content -Path $file -Value "UI initialized for $lang"
        }
    }

    Write-Host "Multilingual UI setup complete."
}
