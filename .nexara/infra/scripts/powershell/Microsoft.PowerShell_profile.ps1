# ┌────────────────────────────────────────────┐
# │ MJ Ahmad's Nexara CLI Profile              │
# │ Ethical • Modular • Audit-Ready            │
# └────────────────────────────────────────────┘

# --- Identity ---
$Host.UI.RawUI.WindowTitle = "🧠 Nexara CLI — MJ's Ethical Workspace"


# --- Central Root ---
$env:NEXARA_ROOT = "C:\MJ-Ahmad"

# --- Subproject Anchors ---
$env:MJ       = "$env:NEXARA_ROOT\mj"
$env:E_BASKET       = "$env:NEXARA_ROOT\E-Basket"
$env:NEXASCEND      = "$env:NEXARA_ROOT\Nexascend"
$env:MJ_NEXARA      = "$env:NEXARA_ROOT\MJ-Nexara"
$env:NEXVOTE        = "$env:NEXARA_ROOT\Nexvote"
$env:NEXMARK        = "$env:NEXARA_ROOT\NexMark"
$env:NEXARAGOV      = "$env:NEXARA_ROOT\NexaraGov"
$env:NXN_GENESIS    = "$env:NEXARA_ROOT\nxn-genesis"
$env:NEXARA_PROTOCOL= "$env:NEXARA_ROOT\nexara-protocol"
$env:LUMID          = "$env:NEXARA_ROOT\LumID"

# --- Ethical Navigation Function ---
function Enter-NexaraProject {
    param([string]$project)

    $base = "$env:NEXARA_ROOT\$project"
    $path = Get-Item -Path $base -ErrorAction SilentlyContinue

    if ($path) {
        Set-Location $path.FullName
        Write-Host "`n📍 Entered project: $project" -ForegroundColor Green
    } elseif (Test-Path "$env:NEXARA_ROOT\quraner-fariwala\$project") {
        Set-Location "$env:NEXARA_ROOT\quraner-fariwala\$project"
        Write-Host "`n📍 Entered Quraner Fariwala subproject: $project" -ForegroundColor Cyan
    } else {
        Write-Host "`n⚠️ Project or subproject '$project' not found." -ForegroundColor Red
    }
}

Set-Alias mj Enter-NexaraProject

# --- Quick Aliases ---
Set-Alias mkdocs "mkdocs serve"


# --- Optional Modules ---
foreach ($module in @("posh-git", "Terminal-Icons")) {
    if (Get-Module -ListAvailable -Name $module) {
        Import-Module $module -ErrorAction SilentlyContinue
        Write-Host "✅ Loaded module: $module" -ForegroundColor Green
    }
}


# Alias
Set-Alias ll Get-ChildItem

# Function
function Greet-MJ {
    Write-Host "Welcome back, MJ! Let's build something ethical today." -ForegroundColor Green
}

# Auto-load script
. "$HOME\Documents\PowerShell\Scripts\init-nexara.ps1"

function ll {
    param (
        [string]$Path = ".",
        [switch]$Hidden,
        [switch]$Detailed
    )

    if (-not (Test-Path $Path)) {
        Write-Host "❌ Path not found: $Path" -ForegroundColor Red
        return
    }

    Write-Host "📂 Listing contents of: $Path" -ForegroundColor Cyan

    $items = Get-ChildItem -Path $Path -Force:$Hidden.IsPresent

    if ($Detailed.IsPresent) {
        $items | Format-Table Name, Length, LastWriteTime, Mode
    } else {
        $items | Select-Object Name
    }
}

