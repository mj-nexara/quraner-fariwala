# ┌─────────────────────────────────────────────┐
# │ MJ DevKit · SSH Authentication Setup        │
# └─────────────────────────────────────────────┘

Write-Host "`n🔐 Starting SSH authentication flow..." -ForegroundColor Cyan

# Step 1: Ensure ssh-agent is running
$agent = Get-Service ssh-agent -ErrorAction SilentlyContinue
if ($null -eq $agent) {
    Write-Host "❌ ssh-agent service not found." -ForegroundColor Red
    exit 1
}
if ($agent.Status -ne 'Running') {
    Write-Host "🧠 Starting ssh-agent..." -ForegroundColor Yellow
    Start-Service ssh-agent
    Write-Host "✅ ssh-agent is now running." -ForegroundColor Green
} else {
    Write-Host "✅ ssh-agent already running." -ForegroundColor Green
}

# Step 2: Add SSH key
$keyPath = "$env:USERPROFILE\.ssh\id_ed25519"
if (Test-Path $keyPath) {
    Write-Host "🔑 Adding SSH key to agent..." -ForegroundColor Yellow
    ssh-add $keyPath | Out-Null
    Write-Host "✅ Key added: id_ed25519" -ForegroundColor Green
} else {
    Write-Host "❌ SSH key not found at $keyPath" -ForegroundColor Red
    Write-Host "📎 Please generate one using: ssh-keygen -t ed25519 -C 'your-email'" -ForegroundColor Magenta
    exit 1
}

# Step 3: Verify GitHub authentication
Write-Host "`n🚀 Verifying GitHub authentication..." -ForegroundColor Cyan
$authResult = ssh -T git@github.com 2>&1

if ($authResult -match "successfully authenticated") {
    Write-Host "✅ GitHub authentication successful!" -ForegroundColor Green
    Write-Host "👤 Identity: $($authResult -replace 'Hi ', '' -replace '!.*', '')" -ForegroundColor Gray
} else {
    Write-Host "⚠️ GitHub authentication failed." -ForegroundColor Red
    Write-Host "📎 Make sure your public key is added at https://github.com/settings/keys" -ForegroundColor Magenta
}

Write-Host "`n🧩 SSH setup complete." -ForegroundColor Cyan
