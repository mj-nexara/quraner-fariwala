function Archive-Records {
    param (
        [string]$SourcePath,
        [string]$ArchivePath = "C:\mj-ahmad\qf\archive"
    )

    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $destination = Join-Path $ArchivePath "archive_$timestamp"

    Copy-Item -Path $SourcePath -Destination $destination -Recurse
    Write-Host "Archived records from $SourcePath to $destination"
}
