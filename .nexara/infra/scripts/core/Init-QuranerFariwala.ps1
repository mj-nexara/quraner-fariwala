# ┌────────────────────────────────────────────┐
# │ Quraner Fariwala Initialization Script     │
# │ Ethical • Spiritual • Audit-Ready          │
# └────────────────────────────────────────────┘

# --- Identity Banner ---
$Host.UI.RawUI.WindowTitle = "📖 Quraner Fariwala — Ethical CLI"
Write-Host "`n🕊️ Welcome to Quraner Fariwala — A mission of truth, dignity, and spiritual clarity." -ForegroundColor Cyan

# --- Root Path Setup ---
$global:QF_ROOT = "C:\quraner-fariwala\quraner-fariwala"

# --- Semantic Anchors ---
$env:QF_DOCS       = "$QF_ROOT\Docs"
$env:QF_SCRIPTS    = "$QF_ROOT\.nexara\infra\scripts"
$env:QF_MEDIA      = "$QF_ROOT\Media"
$env:QF_NETWORK    = "$QF_ROOT\Network"
$env:QF_CONSPIRACY = "$QF_ROOT\Docs\Legal\ImageConspiracy"
$env:QF_DISTRICT   = "$QF_ROOT\Docs\Legacy\DistrictNetwork"

# --- Ethical Reminder ---
Write-Host "`n📜 Every script here is a vow. Every folder is a testimony. Every contributor is a node of dignity." -ForegroundColor Magenta

# --- Logging ---
$logPath = "$QF_ROOT\.nexara\infra\logs\init.log"
"[$(Get-Date)] Quraner Fariwala CLI initialized." | Out-File -FilePath $logPath -Append

# --- Ritual Completion ---
Write-Host "`n✅ Quraner Fariwala CLI environment is now active." -ForegroundColor Green
Write-Host "📁 Current module: $QF_ROOT" -ForegroundColor Yellow
