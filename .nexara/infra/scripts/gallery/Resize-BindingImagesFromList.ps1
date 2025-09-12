# Resize images listed in image-list.txt
$sourceFolder = "C:\Users\quran\OneDrive\Pictures\Camera Roll\2023"
$targetFolder = "C:\MJ-Ahmad\qf\public\videos\cover"
$listFile = "$sourceFolder\video-list.txt"

# Ensure target folder exists
if (-not (Test-Path $targetFolder)) {
    New-Item -ItemType Directory -Path $targetFolder | Out-Null
    Write-Host "📁 Created target folder: $targetFolder" -ForegroundColor Green
}

# Read filenames and process
$filenames = Get-Content $listFile
$counter = 1

foreach ($name in $filenames) {
    $inputPath = Join-Path $sourceFolder $name
    $outputName = "vid-" + $counter.ToString("D3") + ".mp4"
    $outputPath = Join-Path $targetFolder $outputName

    $cmd = "magick `"$inputPath`" -resize 1280x `"$outputPath`""
    Invoke-Expression $cmd
    Write-Host "🖼️ Resized: $name → $outputName" -ForegroundColor Cyan
    $counter++
}

Write-Host "`n✅ All images resized and saved to: $targetFolder" -ForegroundColor Magenta
