\# QuranerFariwala PowerShell Scripts



\## Purpose

Modular scripts to ensure ethical transparency, archival integrity, and multilingual dignity.



\## Scripts

| Script Name             | Purpose                                      |

|-------------------------|----------------------------------------------|

| Initialize-Project.ps1  | Creates semantic folder structure            |

| Archive-Records.ps1     | Archives records with timestamp              |

| Log-Contributor.ps1     | Logs contributor details                     |

| Generate-WarningBanner.ps1 | Creates ethical warning banners         |

| Setup-MultilingualUI.ps1 | Initializes UI files for supported languages |

| Verify-Integrity.ps1    | Checks SHA256 hash of all files              |



\## Usage

Run each script using:

```powershell

. "path\\to\\script.ps1"

FunctionName

### List-FolderContents.ps1

**Purpose**:  
Lists all files and folders in a given path with type and size.

**Usage**:
```powershell
List-FolderContents -TargetPath "C:\mj-ahmad\quranerfariwala"

### Get-LegacySummary-2018.ps1

**Purpose**:  
Generates a month-wise and week-wise summary of all legacy files from 2018, including timestamps and README presence.

**Usage**:
```powershell
Get-LegacySummary-2018

