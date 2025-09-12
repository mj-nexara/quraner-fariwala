function Initialize-Project {
    param (
        [string]$ProjectName = "qf"
    )

    $basePath = "C:\mj-ahmad\$ProjectName"
    $folders = @("docs", "scripts", "logs", "archive", "contributors")

    foreach ($folder in $folders) {
        $fullPath = Join-Path $basePath $folder
        if (-not (Test-Path $fullPath)) {
            New-Item -Path $fullPath -ItemType Directory | Out-Null
        }
    }

    Write-Host "Initialized project structure for $ProjectName"
}
