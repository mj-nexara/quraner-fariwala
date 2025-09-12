function Get-LegacySummary {
    param (
        [string]$RootPath = "C:\mj-ahmad\qf"
    )

    $legacyFolders = Get-ChildItem -Path $RootPath -Recurse -Directory |
        Where-Object { $_.Name -match "201[8-9]|202[0-4]" }

    foreach ($folder in $legacyFolders) {
        $fileCount = (Get-ChildItem -Path $folder.FullName -File).Count
        Write-Host "📅 $($folder.Name): $fileCount files"
    }
}
