# ┌────────────────────────────────────────────┐
# │ Create-RecognitionCertificate.ps1          │
# │ Honor • Legacy • Printable                 │
# └────────────────────────────────────────────┘

function Create-RecognitionCertificate {
    param (
        [string]$District,
        [string]$Name,
        [string]$Role,
        [string]$Contribution,
        [string]$Date = (Get-Date -Format "yyyy-MM-dd")
    )

    $outputPath = "C:\quraner-fariwala\quraner-fariwala\Docs\Legacy\DistrictNetwork\$District\Certificates"
    if (-not (Test-Path $outputPath)) {
        New-Item -ItemType Directory -Path $outputPath | Out-Null
    }

    $fileName = "$Name-Certificate.txt"
    $fullPath = Join-Path $outputPath $fileName

    $certificate = @()
    $certificate += "🏅 Quraner Fariwala — Contributor Recognition"
    $certificate += "`n---`n"
    $certificate += "📍 District: $District"
    $certificate += "👤 Name: $Name"
    $certificate += "🎓 Role: $Role"
    $certificate += "📦 Contribution: $Contribution"
    $certificate += "🗓️ Date of Recognition: $Date"
    $certificate += "`n---`n"
    $certificate += "🛡️ This certificate honors the spiritual and operational contribution of $Name in the mission of Quraner Fariwala. Their efforts have helped deliver the Quran to hearts across Bangladesh."
    $certificate += "`n"
    $certificate += "> “To honor is to remember. To remember is to preserve.” — MJ Ahmad"

    $certificate | Out-File -FilePath $fullPath -Encoding UTF8
    Write-Host "✅ Recognition certificate created for $Name in $District" -ForegroundColor Green
}
