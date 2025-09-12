function Create-PublicStatement {
    param (
        [string]$Title,
        [string]$Message,
        [string]$Audience = "Public",
        [string]$Author = "MJ Ahmad"
    )

    $fileName = "$Title.md" -replace '[^\w\-]', '_'
    $path = "C:\MJ-Ahmad\qf\Docs\Initiative2025\LegalSafeguards\PublicStatements\$fileName"

    $statement = @()
    $statement += "# ⚖️ $Title"
    $statement += "Issued on $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    $statement += "`n---`n"
    $statement += "$Message"
    $statement += "`n---`n"
    $statement += "🛡️ Author: $Author"
    $statement += "📣 Audience: $Audience"

    $statement | Out-File -FilePath $path -Encoding UTF8
    Write-Host "✅ Public statement created: $Title" -ForegroundColor Green
}
