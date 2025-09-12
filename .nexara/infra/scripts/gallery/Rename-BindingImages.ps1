# ┌────────────────────────────────────────────┐
# │ Rename-BindingImages.ps1                   │
# │ Force Rename • Semantic • Audit-Ready      │
# └────────────────────────────────────────────┘

function Rename-BindingImages {
    $folder = "C:\MJ-Ahmad\qf\public\images\binding\normalized"
    $images = Get-ChildItem -Path $folder -Include *.jpg, *.jpeg, *.png -File | Sort-Object LastWriteTime
    $counter = 1

    foreach ($img in $images) {
        $ext = $img.Extension.ToLower()
        $newName = "binding-" + $counter.ToString("D3") + $ext
        $newPath = Join-Path $folder $newName

        try {
            Rename-Item -Path $img.FullName -NewName $newName -Force
            Write-Host "🔁 Renamed: $($img.Name) → $newName" -ForegroundColor Cyan
        } catch {
            Write-Host "❌ Failed to rename: $($img.Name)" -ForegroundColor Red
        }

        $counter++
    }

    Write-Host "`n✅ All images renamed with semantic clarity." -ForegroundColor Magenta
}
