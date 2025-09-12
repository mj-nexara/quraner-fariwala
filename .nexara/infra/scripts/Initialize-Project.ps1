function Initialize-Project {
    param (
        [string]$ProjectName = "quraner-fariwala"
    )

    $basePath = "C:\quraner-fariwala\$ProjectName"
    $folders = @("docs", "scripts", "logs", "archive", "contributors")

    foreach ($folder in $folders) {
        $fullPath = Join-Path $basePath $folder
        if (-not (Test-Path $fullPath)) {
            New-Item -Path $fullPath -ItemType Directory | Out-Null
        }
    }

    Write-Host "Initialized project structure for $ProjectName"
}
