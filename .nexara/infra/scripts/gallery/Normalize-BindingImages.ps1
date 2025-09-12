# ┌────────────────────────────────────────────┐
# │ Normalize-BindingImages.ps1                │
# │ Renames + Resizes Binding Images           │
# │ Ethical • UI-Ready • Sequential            │
# └────────────────────────────────────────────┘

# Requires: ImageMagick installed and added to PATH (for resizing)
function Normalize-BindingImages {
    $folder = "C:\MJ-Ahmad\qf\public\images\binding"
    $outputFolder = "$folder\normalized"
    if (-not (Test-Path $outputFolder)) {
        New-Item -ItemType Directory -Path $outputFolder | Out-Null
        Write-Host "📁 Created output folder: $outputFolder" -ForegroundColor Green
    }

    $images = Get-ChildItem -Path $folder -Include *.jpg, *.jpeg, *.png -File | Sort-Object Name
    $counter = 1

    foreach ($img in $images) {
        $ext = $img.Extension.ToLower()
        $newName = "binding-" + $counter.ToString("D3") + $ext
        $newPath = Join-Path $outputFolder $newName

        # Resize using ImageMagick's 'magick' CLI tool
        $resizeCommand = "magick `"$($img.FullName)`" -resize 1280x $newPath"
        Invoke-Expression $resizeCommand

        Write-Host "🖼️ Renamed & resized: $($img.Name) → $newName" -ForegroundColor Cyan
        $counter++
    }

    Write-Host "`n✅ All binding images normalized and saved to: $outputFolder" -ForegroundColor Magenta
}
