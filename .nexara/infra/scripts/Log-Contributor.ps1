function Log-Contributor {
    param (
        [string]$Name,
        [string]$Role,
        [string]$Notes
    )

    $logPath = "C:\mj-ahmad\qf\contributors\log.csv"
    $entry = "$((Get-Date).ToString('s')),$Name,$Role,$Notes"
    Add-Content -Path $logPath -Value $entry

    Write-Host "Logged contributor: $Name"
}
