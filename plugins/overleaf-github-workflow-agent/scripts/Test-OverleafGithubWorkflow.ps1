[CmdletBinding()]
param(
    [string]$RepoRoot = "",
    [string]$Branch = "",
    [string[]]$PrivatePaths = @("11_GRADES"),
    [switch]$CheckRemoteAccess,
    [switch]$Json
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$checks = New-Object System.Collections.Generic.List[object]

function Add-Check {
    param(
        [ValidateSet("PASS", "WARN", "FAIL", "INFO")]
        [string]$Status,
        [string]$Name,
        [string]$Details = "",
        [string]$NextStep = ""
    )

    $checks.Add([pscustomobject]@{
        Status = $Status
        Name = $Name
        Details = $Details
        NextStep = $NextStep
    }) | Out-Null
}

function Test-CommandAvailable {
    param([string]$Name)
    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Invoke-Git {
    param([string[]]$Arguments)

    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        $output = & git -C $script:ResolvedRepoRoot @Arguments 2>&1
        $code = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }

    return [pscustomobject]@{
        Code = $code
        Output = ($output -join "`n").Trim()
    }
}

function Invoke-External {
    param(
        [string]$Command,
        [string[]]$Arguments = @()
    )

    $previousErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try {
        $output = & $Command @Arguments 2>&1
        $code = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }

    return [pscustomobject]@{
        Code = $code
        Output = ($output -join "`n").Trim()
    }
}

function Test-FileContainsPattern {
    param(
        [string]$Path,
        [string]$Pattern
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        return $false
    }

    $text = Get-Content -LiteralPath $Path -Raw
    return $text -match $Pattern
}

$gitAvailable = Test-CommandAvailable "git"

if ([string]::IsNullOrWhiteSpace($RepoRoot)) {
    if ($gitAvailable) {
        $candidate = & git rev-parse --show-toplevel 2>$null
        if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($candidate)) {
            $RepoRoot = $candidate.Trim()
        }
    }

    if ([string]::IsNullOrWhiteSpace($RepoRoot)) {
        $RepoRoot = (Get-Location).Path
    }
}

try {
    $script:ResolvedRepoRoot = (Resolve-Path -LiteralPath $RepoRoot).Path
} catch {
    Add-Check -Status "FAIL" -Name "Repository root" -Details "Path does not exist: $RepoRoot" -NextStep "Run the script from the repository root or pass -RepoRoot."
    if ($Json) {
        $checks | ConvertTo-Json -Depth 5
    } else {
        $checks | Format-Table -AutoSize
    }
    exit 1
}

Add-Check -Status "INFO" -Name "Repository root" -Details $script:ResolvedRepoRoot

if ($script:ResolvedRepoRoot -match "OneDrive|Dropbox|iCloud|Google Drive") {
    Add-Check -Status "INFO" -Name "Cloud-sync folder" -Details "Repository path appears to be inside a cloud-synced folder." -NextStep "If Git or LaTeX reports file locks, wait briefly or pause sync while compiling."
}

if ($gitAvailable) {
    $gitVersion = & git --version
    Add-Check -Status "PASS" -Name "Git available" -Details ($gitVersion -join " ")
} else {
    Add-Check -Status "FAIL" -Name "Git available" -Details "git was not found on PATH." -NextStep "Install Git, restart the editor/terminal, and rerun git --version."
}

if (Test-CommandAvailable "gh") {
    $ghVersion = Invoke-External -Command "gh" -Arguments @("--version")
    Add-Check -Status "PASS" -Name "GitHub CLI available" -Details (($ghVersion.Output -split "`n" | Select-Object -First 1) -join " ")
} else {
    Add-Check -Status "INFO" -Name "GitHub CLI available" -Details "gh was not found on PATH." -NextStep "Optional: install GitHub CLI if you want terminal-based GitHub repo and PR commands."
}

if (Test-CommandAvailable "latexmk") {
    $latexmkVersion = Invoke-External -Command "latexmk" -Arguments @("-v")
    if ($latexmkVersion.Code -eq 0) {
        Add-Check -Status "PASS" -Name "latexmk available" -Details (($latexmkVersion.Output -split "`n" | Select-Object -First 1) -join " ")
    } else {
        Add-Check -Status "WARN" -Name "latexmk available" -Details "latexmk exists but did not run cleanly." -NextStep "Run latexmk -v directly and check the LaTeX installation."
    }
} else {
    Add-Check -Status "FAIL" -Name "latexmk available" -Details "latexmk was not found on PATH." -NextStep "Install TeX Live, MiKTeX, or TinyTeX and confirm latexmk -v works."
}

if (Test-CommandAvailable "pdflatex") {
    $pdfLatexVersion = Invoke-External -Command "pdflatex" -Arguments @("--version")
    if ($pdfLatexVersion.Code -eq 0) {
        Add-Check -Status "PASS" -Name "pdflatex available" -Details (($pdfLatexVersion.Output -split "`n" | Select-Object -First 1) -join " ")
    } else {
        Add-Check -Status "WARN" -Name "pdflatex available" -Details "pdflatex exists but did not run cleanly." -NextStep "Run pdflatex --version directly and check the LaTeX installation."
    }
} else {
    Add-Check -Status "WARN" -Name "pdflatex available" -Details "pdflatex was not found on PATH." -NextStep "Check that the LaTeX distribution bin folder is on PATH."
}

if ($gitAvailable) {
    $insideWorkTree = Invoke-Git -Arguments @("rev-parse", "--is-inside-work-tree")
    if ($insideWorkTree.Code -eq 0 -and $insideWorkTree.Output -eq "true") {
        Add-Check -Status "PASS" -Name "Git repository" -Details "The selected root is inside a Git working tree."

        $currentBranch = Invoke-Git -Arguments @("branch", "--show-current")
        if ($currentBranch.Code -eq 0 -and -not [string]::IsNullOrWhiteSpace($currentBranch.Output)) {
            Add-Check -Status "INFO" -Name "Current branch" -Details $currentBranch.Output
            if ([string]::IsNullOrWhiteSpace($Branch)) {
                $Branch = $currentBranch.Output
            }
        } else {
            Add-Check -Status "WARN" -Name "Current branch" -Details "No branch name was returned." -NextStep "You may be in detached HEAD state. Run git status for details."
        }

        if ([string]::IsNullOrWhiteSpace($Branch)) {
            $Branch = "main"
        }

        $status = Invoke-Git -Arguments @("status", "--short")
        if ($status.Code -eq 0) {
            if ([string]::IsNullOrWhiteSpace($status.Output)) {
                Add-Check -Status "PASS" -Name "Working tree" -Details "No uncommitted changes detected."
            } else {
                Add-Check -Status "WARN" -Name "Working tree" -Details "Uncommitted changes detected." -NextStep "Review git status --short and git diff before pulling, committing, or pushing."
            }
        }

        $remoteList = Invoke-Git -Arguments @("remote")
        $remotes = @()
        if ($remoteList.Code -eq 0 -and -not [string]::IsNullOrWhiteSpace($remoteList.Output)) {
            $remotes = @($remoteList.Output -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ })
        }

        if (@($remotes).Count -eq 0) {
            Add-Check -Status "WARN" -Name "Git remotes" -Details "No remotes configured." -NextStep "Clone from Overleaf or add overleaf/github remotes."
        } else {
            Add-Check -Status "INFO" -Name "Git remotes" -Details ($remotes -join ", ")
        }

        if ($remotes -contains "overleaf") {
            $overleafUrl = Invoke-Git -Arguments @("remote", "get-url", "overleaf")
            if ($overleafUrl.Output -match "overleaf") {
                Add-Check -Status "PASS" -Name "overleaf remote" -Details $overleafUrl.Output
            } else {
                Add-Check -Status "WARN" -Name "overleaf remote" -Details $overleafUrl.Output -NextStep "Confirm this remote points to git.overleaf.com."
            }
        } else {
            $originUrl = Invoke-Git -Arguments @("remote", "get-url", "origin")
            if ($originUrl.Code -eq 0 -and $originUrl.Output -match "overleaf") {
                Add-Check -Status "WARN" -Name "overleaf remote" -Details "origin appears to point to Overleaf." -NextStep "Consider: git remote rename origin overleaf"
            } else {
                Add-Check -Status "WARN" -Name "overleaf remote" -Details "No remote named overleaf." -NextStep "Clone from Overleaf or rename the Overleaf remote to overleaf."
            }
        }

        if ($remotes -contains "github") {
            $githubUrl = Invoke-Git -Arguments @("remote", "get-url", "github")
            if ($githubUrl.Output -match "github\.com") {
                Add-Check -Status "PASS" -Name "github remote" -Details $githubUrl.Output
            } else {
                Add-Check -Status "WARN" -Name "github remote" -Details $githubUrl.Output -NextStep "Confirm this remote points to the intended GitHub repository."
            }
        } else {
            Add-Check -Status "WARN" -Name "github remote" -Details "No remote named github." -NextStep "Create an empty GitHub repo, then run git remote add github https://github.com/OWNER/REPO.git"
        }

        foreach ($privatePath in $PrivatePaths) {
            $placeholderPath = "$privatePath/README.md"
            $placeholderFullPath = Join-Path $script:ResolvedRepoRoot $placeholderPath
            if (Test-Path -LiteralPath $placeholderFullPath) {
                $placeholderCheck = Invoke-Git -Arguments @("check-ignore", "-q", "--", $placeholderPath)
                if ($placeholderCheck.Code -ne 0) {
                    Add-Check -Status "PASS" -Name "Private folder shell" -Details "$placeholderPath exists and is not ignored, so $privatePath/ can appear in Overleaf and GitHub."
                } else {
                    Add-Check -Status "WARN" -Name "Private folder shell" -Details "$placeholderPath exists but is ignored." -NextStep "Add !/$placeholderPath to .gitignore."
                }
            } else {
                Add-Check -Status "WARN" -Name "Private folder shell" -Details "$placeholderPath does not exist." -NextStep "Create a harmless tracked placeholder so the folder appears in Overleaf and GitHub."
            }

            $contentProbe = "$privatePath/__codex_private_probe__.tmp"
            $contentCheck = Invoke-Git -Arguments @("check-ignore", "-q", "--", $contentProbe)
            if ($contentCheck.Code -eq 0) {
                Add-Check -Status "PASS" -Name "Private contents ignored" -Details "Files inside $privatePath/ are ignored by Git."
            } else {
                Add-Check -Status "WARN" -Name "Private contents ignored" -Details "Files inside $privatePath/ are not ignored by Git." -NextStep "Add /$privatePath/* to .gitignore before pushing private material."
            }
        }

        if ($CheckRemoteAccess) {
            foreach ($remoteName in @("overleaf", "github")) {
                if ($remotes -contains $remoteName) {
                    $remoteCheck = Invoke-Git -Arguments @("ls-remote", "--heads", $remoteName)
                    if ($remoteCheck.Code -eq 0) {
                        Add-Check -Status "PASS" -Name "$remoteName access" -Details "git ls-remote succeeded."
                    } else {
                        Add-Check -Status "WARN" -Name "$remoteName access" -Details "git ls-remote failed or was cancelled." -NextStep "Check credentials, token, network, and remote URL."
                    }
                }
            }
        } else {
            Add-Check -Status "INFO" -Name "Remote access checks" -Details "Skipped by default." -NextStep "Run with -CheckRemoteAccess if you want git ls-remote checks that may prompt for credentials."
        }
    } else {
        Add-Check -Status "FAIL" -Name "Git repository" -Details "The selected root is not inside a Git working tree." -NextStep "Run this from the cloned repository root."
    }
}

$gitignorePath = Join-Path $script:ResolvedRepoRoot ".gitignore"
if (Test-Path -LiteralPath $gitignorePath) {
    Add-Check -Status "PASS" -Name ".gitignore present" -Details ".gitignore exists at the repository root."

    $gradesIgnoreRule = Test-FileContainsPattern -Path $gitignorePath -Pattern "(?m)^\s*/?11_GRADES/\*\s*$"
    $gradesPlaceholderRule = Test-FileContainsPattern -Path $gitignorePath -Pattern "(?m)^\s*!/?11_GRADES/README\.md\s*$"
    if ($gradesIgnoreRule -and $gradesPlaceholderRule) {
        Add-Check -Status "PASS" -Name ".gitignore private rule" -Details "11_GRADES contents are ignored while README.md is allowed."
    } else {
        Add-Check -Status "WARN" -Name ".gitignore private rule" -Details "The 11_GRADES placeholder/content pattern was not found." -NextStep "Use /11_GRADES/* and !/11_GRADES/README.md."
    }

    $latexPatterns = @(
        "*.aux",
        "*.log",
        "*.out",
        "*.toc",
        "*.fls",
        "*.fdb_latexmk",
        "*.synctex.gz"
    )
    $missingPatterns = @()
    foreach ($pattern in $latexPatterns) {
        $linePattern = "(?m)^\s*" + [regex]::Escape($pattern) + "\s*$"
        if (-not (Test-FileContainsPattern -Path $gitignorePath -Pattern $linePattern)) {
            $missingPatterns += $pattern
        }
    }

    if (@($missingPatterns).Count -eq 0) {
        Add-Check -Status "PASS" -Name ".gitignore LaTeX rules" -Details "Common LaTeX auxiliary patterns are covered."
    } else {
        Add-Check -Status "WARN" -Name ".gitignore LaTeX rules" -Details ("Missing: " + ($missingPatterns -join ", ")) -NextStep "Add common LaTeX auxiliary patterns to .gitignore."
    }
} else {
    Add-Check -Status "WARN" -Name ".gitignore present" -Details "No .gitignore found at repository root." -NextStep "Create one before pushing to GitHub."
}

$settingsPath = Join-Path $script:ResolvedRepoRoot ".vscode\settings.json"
if (Test-Path -LiteralPath $settingsPath) {
    Add-Check -Status "PASS" -Name "Workspace settings" -Details ".vscode/settings.json exists."
    $settingsText = Get-Content -LiteralPath $settingsPath -Raw

    if ($settingsText -match '"latex-workshop\.latex\.outDir"\s*:\s*"%DIR%"') {
        Add-Check -Status "PASS" -Name "LaTeX Workshop outDir" -Details "PDFs should be produced beside their .tex files."
    } elseif ($settingsText -match '"latex-workshop\.latex\.outDir"') {
        Add-Check -Status "WARN" -Name "LaTeX Workshop outDir" -Details "outDir is set, but not to %DIR%." -NextStep "Use %DIR% if PDFs should stay beside .tex files."
    } else {
        Add-Check -Status "INFO" -Name "LaTeX Workshop outDir" -Details "No workspace outDir setting found." -NextStep "Add latex-workshop.latex.outDir = %DIR% if this repo needs consistent local builds."
    }

    if ($settingsText -match '"latex-workshop\.latex\.autoClean\.run"\s*:\s*"onBuilt"') {
        Add-Check -Status "PASS" -Name "LaTeX Workshop autoClean" -Details "autoClean is set to onBuilt."
    } else {
        Add-Check -Status "INFO" -Name "LaTeX Workshop autoClean" -Details "autoClean onBuilt was not found in workspace settings."
    }
} else {
    Add-Check -Status "INFO" -Name "Workspace settings" -Details ".vscode/settings.json does not exist." -NextStep "Optional: create workspace settings for LaTeX Workshop."
}

if ($Json) {
    $checks | ConvertTo-Json -Depth 5
} else {
    $checks | Format-Table -AutoSize

    $failCount = @($checks | Where-Object { $_.Status -eq "FAIL" }).Count
    $warnCount = @($checks | Where-Object { $_.Status -eq "WARN" }).Count
    ""
    "Summary: $failCount failure(s), $warnCount warning(s)."
    "This script is read-only by default. It does not commit, push, store credentials, or modify files."
}
