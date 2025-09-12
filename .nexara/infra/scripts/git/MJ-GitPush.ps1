<#
.SYNOPSIS
  Adds, commits, and pushes changes to the main branch in serial order.

.DESCRIPTION
  This script stages all changes, prompts for a commit message, and pushes to origin/main.
  Designed for MJ DevKit contributors working in C:\MJ-Ahmad\qf.

.NOTES
  Author: MJ Ahmad
  Version: 1.0.0
  Tags: Git, Commit, Push, MJ DevKit
#>

Write-Host "`n🚀 MJ DevKit: Starting Git push sequence..." -ForegroundColor Cyan

# Step 1: Navigate to repo
Set-Location "C:\quraner-fariwala\quraner-fariwala"
Write-Host "📁 Working directory set to C:\quraner-fariwala\quraner-fariwala" -ForegroundColor Yellow

# Step 2: Stage all changes
git add .
Write-Host "✅ Changes staged with git add ." -ForegroundColor Green

# Step 3: Prompt for commit message
$commitMessage = Read-Host "📝 Enter commit message"
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "⚠️ Commit message cannot be empty. Aborting." -ForegroundColor Red
    exit
}

# Step 4: Commit changes
git commit -m "$commitMessage"
Write-Host "📦 Commit created: '$commitMessage'" -ForegroundColor Green

# Step 5: Push to origin/main
git push origin main
Write-Host "📤 Pushed to origin/main" -ForegroundColor Green

Write-Host "`n✅ MJ DevKit: Git push sequence complete." -ForegroundColor Cyan
