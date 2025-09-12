# ┌────────────────────────────────────────────┐
# │ ForceRename-BindingImages.ps1              │
# │ Ignores Old Name • Overwrites with New     │
# │ Ethical • Deterministic • UI-Ready         │
# └────────────────────────────────────────────┘

function ForceRename-BindingImages {
    $sourceFolder = "C:\MJ-Ahmad\qf\public\images\binding\normalized"
    $tempFolder = "$sourceFolder\renamed"

    # Create output folder
    if (-not (Test-Path $tempFolder)) {
        New-Item -ItemType Directory -Path $tempFolder | Out-Null
        Write-Host "📁 Created output folder: $tempFolder" -ForegroundColor Green
    }

    # Get all image files
    $images = Get-ChildItem -Path $sourceFolder -Include *.jpg, *.jpeg, *.png -File | Sort-Object LastWriteTime
    $counter = 1

    foreach ($img in $images) {
        $ext = $img.Extension.ToLower()
        $newName = "binding-" + $counter.ToString("D3") + $ext
        $newPath = Join-Path $tempFolder $newName

        Copy-Item -Path $img.FullName -Destination $newPath -Force
        Write-Host "🆕 Saved as: $newName" -ForegroundColor Cyan
        $counter++
    }

    Write-Host "`n✅ All images force-renamed and saved to: $tempFolder" -ForegroundColor Magenta
}
