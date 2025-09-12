function List-FolderContents {
    param (
        [string]$TargetPath = "C:\mj-ahmad\qf"
    )

    if (-not (Test-Path $TargetPath)) {
        Write-Host "❌ Path not found: $TargetPath" -ForegroundColor Red
        return
    }

    Write-Host "`n📁 Listing contents of: $TargetPath" -ForegroundColor Cyan
    Write-Host "--------------------------------------------------"

    $items = Get-ChildItem -Path $TargetPath

    foreach ($item in $items) {
        $type = if ($item.PSIsContainer) { "📂 Folder" } else { "📄 File" }
        $size = if (-not $item.PSIsContainer) { "{0:N0} bytes" -f $item.Length } else { "" }
        Write-Host "$type`t$item.Name`t$size"
    }

    Write-Host "`n✅ Listing complete." -ForegroundColor Green
}
