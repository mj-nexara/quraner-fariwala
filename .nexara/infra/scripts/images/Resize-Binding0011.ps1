# MJ Ahmad's CLI: Resize binding0011.jpg to 1280x803

# Source and destination paths
$sourceImage = "C:\MJ-Ahmad\qf\public\images\binding\binding-148.jpg"
$destinationImage = "C:\MJ-Ahmad\qf\public\images\binding\binding148-re.jpg"

# Resize using ImageMagick
magick convert $sourceImage -resize 1280x803^> $destinationImage

# Confirmation
Write-Host "✅ Image resized to 1280x803 and saved as: $destinationImage"
