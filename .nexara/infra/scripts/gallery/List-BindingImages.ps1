# ┌────────────────────────────────────────────┐
# │ List-BindingImages.ps1                     │
# │ Creates a sequential list of image names   │
# │ Ethical • Audit-Ready • Simple             │
# └────────────────────────────────────────────┘

function List-BindingImages {
    $folder = "C:\MJ-Ahmad\qf\public\images\binding\normalized"
    $outputFile = "$folder\binding-image-list.txt"

    $images = Get-ChildItem -Path $folder -Include *.jpg, *.jpeg, *.png -File | Sort-Object LastWriteTime
    $list = @()
    $counter = 1

    foreach ($img in $images) {
        $newName = "binding-" + $counter.ToString("D3") + $img.Extension.ToLower()
        $list += $newName
        $counter++
    }

    $list | Out-File -FilePath $outputFile -Encoding UTF8
    Write-Host "📄 Image list saved to: $outputFile" -ForegroundColor Green
}
