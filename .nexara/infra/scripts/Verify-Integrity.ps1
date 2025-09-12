function Verify-Integrity {
    param (
        [string]$FolderPath
    )

    $files = Get-ChildItem -Path $FolderPath -Recurse
    foreach ($file in $files) {
        $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256
        Write-Host "$($file.Name): $($hash.Hash)"
    }

    Write-Host "Integrity check complete for $FolderPath"
}
