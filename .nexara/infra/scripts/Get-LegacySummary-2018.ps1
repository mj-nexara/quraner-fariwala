function Get-S-2018 {
    param (
        [string]$RootPath = "C:\mj-ahmad\qf\Docs\Legacy\Timeline\2018"
    )

    if (-not (Test-Path $RootPath)) {
        Write-Host "❌ Path not found: $RootPath" -ForegroundColor Red
        return
    }

    Write-Host "`n📅 Legacy Summary for 2018" -ForegroundColor Cyan
    Write-Host "--------------------------------------------------"

    $months = Get-ChildItem -Path $RootPath -Directory | Sort-Object Name

    foreach ($month in $months) {
        Write-Host "`n🗓️ Month: $($month.Name)" -ForegroundColor Yellow

        $weeks = Get-ChildItem -Path $month.FullName -Directory | Sort-Object Name

        foreach ($week in $weeks) {
            Write-Host "  📆 Week: $($week.Name)" -ForegroundColor Magenta

            $files = Get-ChildItem -Path $week.FullName -File
            foreach ($file in $files) {
                $timestamp = $file.LastWriteTime.ToString("yyyy-MM-dd HH:mm")
                Write-Host "    📄 $($file.Name)  🕒 $timestamp"
            }

            $readme = Join-Path $week.FullName "README.md"
            if (Test-Path $readme) {
                Write-Host "    📘 README found ✅"
            } else {
                Write-Host "    ⚠️ README missing" -ForegroundColor Red
            }
        }
    }

    Write-Host "`n✅ Summary complete." -ForegroundColor Green
}
