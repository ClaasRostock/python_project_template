# Script to set package name, author etc. in a new Python project.
# The script renames the package, adapts its structure
# and updates the author information in all files.
# All changes get committed to a new branch 'rename-package',
# allowing them to be reviewed before merging into main.

# NOTE: This script only works for new Python projects created through the
# python_project_template (https://github.com/owner/python_project_template).

param (
    # Project folder in which renaming shall be executed.
    [string]
    $ProjectFolder = $null,

    # CSV file with names to be applied.
    # Entries in the CSV file will take priority
    # over names defined in this script.
    # Leave empty if no CSV file with names exists (yet).
    # (It will be created after the first run of this script)
    [string]
    $NamesFile = $null
)


# -----MANDATORY NAMES-----

# The names in this section are mandatory.
# Meaning, the corresponding variables _must_ be set to non-empty values,
# either here in the script, or through a CSV file.
#
# If provided, entries in the CSV file will generally take priority
# over values defined in this script.
#
# Default name of the CSV file is 'names.csv'.
# It is expected to be located in the project folder.
# If a different name or location is used, set the parameter $NamesFile.
#
# If a CSV file is used, it must have the following structure:
# Row 0: Variable,Value
# Row 1-n: <Variable>,<Value>
#
# Example:
# Variable,Value
# PackageNameDashed,my-package
# PackageNameCapitalized,MyPackage
# GitHubOrganisation,owner
# Author1Name,Author One
# Author1Email,author.one@xyz.com
# Author1LinkedIn,https://www.linkedin.com/in/authorone
# ...

# Package name
$PackageNameDashed = "my-package"  # Package name in dashed form
$PackageNameCapitalized = "MyPackage"  # Package name in capitalized form

# GitHub organization
$GitHubOrganisation = "owner"

# Name, email and LinkedIn URL of author 1:
$Author1Name = "Author One"
$Author1Email = "author.one@xyz.com"
$Author1LinkedIn = "https://www.linkedin.com/in/authorone"


# -----OPTIONAL NAMES-----

# Leave empty if not needed.
# If left empty, the corresponding elements in the project get removed.

# Optional: Name of a first subpackage and -module therein:
$SubPackage1Name = ""
$Module1Name = ""

# Optional: Name of a second subpackage and -module therein:
$SubPackage2Name = ""
$Module2Name = ""

# Optional: Name, email and LinkedIn URL of author 2:
$Author2Name = ""
$Author2Email = ""
$Author2LinkedIn = ""

# Optional: Name, email and LinkedIn URL of author 3:
$Author3Name = ""
$Author3Email = ""
$Author3LinkedIn = ""

# Optional: Name, email and LinkedIn URL of Maintainer 1:
$Maintainer1Name = ""
$Maintainer1Email = ""
$Maintainer1LinkedIn = ""

# Optional: Name, email and LinkedIn URL of Maintainer 2:
$Maintainer2Name = ""
$Maintainer2Email = ""
$Maintainer2LinkedIn = ""

# Optional: Keywords
$Keyword1 = ""
$Keyword2 = ""
$Keyword3 = ""


###### DO NOT CHANGE ANYTHING BELOW THIS LINE #######


# -----PREPARE-----

# Branch on which the renaming changes shall be committed
$NewBranch = "rename-package"
$PushToRemote = $false
$StayOnNewBranch = $false

$JobName = "Rename package"

Write-Host "Start: $JobName"

$Cwd = Get-Location

if (-not $ProjectFolder) {
    # Parameter $ProjectFolder was not set.
    # Set $ProjectFolder to the parent folder of this script
    $ProjectFolder = Split-Path -parent $MyInvocation.MyCommand.Definition | Get-Item
}

if (-not ( Test-Path $ProjectFolder)) {
    Write-Host "Project folder not found: $ProjectFolder"
    Return
}

if (-not ( Test-Path $ProjectFolder\.git\config)) {
    Write-Host "Project folder is not a git repository: $ProjectFolder"
    Return
}

$Folder = Get-Item $ProjectFolder
$Project = Split-Path -leaf $Folder

if (-not ($NamesFile)) {
    # Parameter $NamesFile was not set.
    # Set $NamesFile to the default file name.
    $NamesFile = "$Folder\names.csv"
}
$NamesFileName = Split-Path -Leaf $NamesFile

Write-Host "$JobName : $Project@$NewBranch"

Set-Location $Folder

# If a csv file with names exists, read it
$Names = $null
if (Test-Path $NamesFile) {
    $Names = Import-Csv -Path $NamesFile
    foreach ($Name in $Names) {
        $Variable = $Name.Variable
        $Value = $Name.Value
        if ($Variable -and $Value) {
            try {
                Set-Variable -Name $Variable -Value $Value -ErrorAction Stop
            }
            catch {
                Write-Host "Error: $($_.Exception.Message)"
            }
        }
    }
}

# Validate that mandatory variables (names) are set to non-empty values
$MandatoryVariables = @(
    "PackageNameDashed",
    "PackageNameCapitalized",
    "GitHubOrganisation"
    "Author1Name",
    "Author1Email"
)
foreach ($MandatoryVariable in $MandatoryVariables) {
    $Variable = $null
    $Value = $null
    $Variable = $MandatoryVariable
    $Value = Get-Variable -Name $Variable -ValueOnly
    if (-not $Value) {
        Write-Host "Error: Mandatory variable $Variable is not set."
        Return
    }
}

# Delete all cache folders. Delete also .venv, if existing.
# These can cause problems after renaming the package and its structure
$Delete = @(
    # ".venv",
    ".tox",
    ".pytest_cache",
    ".ruff_cache",
    "__pycache__",
    ".mypy_cache",
    "*.egg-info",
    "_autosummary"
)

$Deletes = @()
foreach ($Pattern in $Delete) {
    $PatternEscaped = [regex]::Escape($Pattern)
    $Deletes += Get-ChildItem -Recurse -Directory | Where-Object { $_.Name -match $PatternEscaped }
}
$Deletes | Remove-Item -Recurse -Force

# Folders and files excluded from renaming
$Exclude = @(
    ".git",
    ".venv",
    "cases",
    "rename_package.ps1",
    $NamesFileName
)

# -----SEARCH PATTERNS AND REPLACEMENTS-----

$Renamings = @()

$Renamings += @{
    Pattern  = "my-package"
    Replace  = $PackageNameDashed
    Variable = "PackageNameDashed"
}

$Renamings += @{
    Pattern  = "MyPackage"
    Replace  = $PackageNameCapitalized
    Variable = "PackageNameCapitalized"
}

$PackageNameUnderscored = $PackageNameDashed -replace "-", "_"
$Renamings += @{
    Pattern = "my_package"
    Replace = $PackageNameUnderscored
}

$PackageNameLower = $PackageNameCapitalized.ToLower()
$Renamings += @{
    Pattern = "mypackage"
    Replace = $PackageNameLower
}

$Renamings += @{
    Pattern  = "owner"
    Replace  = $GitHubOrganisation
    Variable = "GitHubOrganisation"
}

$Renamings += @{
    Pattern  = "subpackage1"
    Replace  = $SubPackage1Name
    Variable = "SubPackage1Name"
}

$Renamings += @{
    Pattern  = "module1"
    Replace  = $Module1Name
    Variable = "Module1Name"
}

$Renamings += @{
    Pattern  = "subpackage2"
    Replace  = $SubPackage2Name
    Variable = "SubPackage2Name"
}

$Renamings += @{
    Pattern  = "module2"
    Replace  = $Module2Name
    Variable = "Module2Name"
}

$Renamings += @{
    Pattern  = "Author One"
    Replace  = $Author1Name
    Variable = "Author1Name"
}

$Renamings += @{
    Pattern  = "author.one@xyz.com"
    Replace  = $Author1Email
    Variable = "Author1Email"
}

$Renamings += @{
    Pattern  = "https://www.linkedin.com/in/authorone"
    Replace  = $Author1LinkedIn
    Variable = "Author1LinkedIn"
}

$Renamings += @{
    Pattern  = "Author Two"
    Replace  = $Author2Name
    Variable = "Author2Name"
}

$Renamings += @{
    Pattern  = "author.two@xyz.com"
    Replace  = $Author2Email
    Variable = "Author2Email"
}

$Renamings += @{
    Pattern  = "https://www.linkedin.com/in/authortwo"
    Replace  = $Author2LinkedIn
    Variable = "Author2LinkedIn"
}

$Renamings += @{
    Pattern  = "Author Three"
    Replace  = $Author3Name
    Variable = "Author3Name"
}

$Renamings += @{
    Pattern  = "author.three@xyz.com"
    Replace  = $Author3Email
    Variable = "Author3Email"
}

$Renamings += @{
    Pattern  = "https://www.linkedin.com/in/authorthree"
    Replace  = $Author3LinkedIn
    Variable = "Author3LinkedIn"
}

$Renamings += @{
    Pattern  = "Maintainer One"
    Replace  = $Maintainer1Name
    Variable = "Maintainer1Name"
}

$Renamings += @{
    Pattern  = "maintainer.one@xyz.com"
    Replace  = $Maintainer1Email
    Variable = "Maintainer1Email"
}

$Renamings += @{
    Pattern  = "https://www.linkedin.com/in/maintainerone"
    Replace  = $Maintainer1LinkedIn
    Variable = "Maintainer1LinkedIn"
}

$Renamings += @{
    Pattern  = "Maintainer Two"
    Replace  = $Maintainer2Name
    Variable = "Maintainer2Name"
}

$Renamings += @{
    Pattern  = "maintainer.two@xyz.com"
    Replace  = $Maintainer2Email
    Variable = "Maintainer2Email"
}

$Renamings += @{
    Pattern  = "https://www.linkedin.com/in/maintainertwo"
    Replace  = $Maintainer2LinkedIn
    Variable = "Maintainer2LinkedIn"
}

$Renamings += @{
    Pattern  = "Keyword One"
    Replace  = $Keyword1
    Variable = "Keyword1"
}

$Renamings += @{
    Pattern  = "Keyword Two"
    Replace  = $Keyword2
    Variable = "Keyword2"
}

$Renamings += @{
    Pattern  = "Keyword Three"
    Replace  = $Keyword3
    Variable = "Keyword3"
}


# -----GIT-----

$OriginalBranch = $null
$OriginalBranch = git branch --show-current

# Stash any uncommited changes in working tree
$WorkingTreeDirty = $null
$WorkingTreeDirty = git status --porcelain
$StashedWorkingTree = $false
if ($WorkingTreeDirty) {
    & git stash push --all
    $StashedWorkingTree = $true
}

& git checkout main
& git pull

# Check if branch already exists
$NewBranchEscaped = [regex]::Escape($NewBranch)
$NewBranchExistsOnRemote = $false
$NewBranchExistsOnLocal = $false
& git fetch
$RemoteBranches = $null
$RemoteBranches = git branch -r -v
foreach ($RemoteBranch in $RemoteBranches) {
    if ($RemoteBranch -match $NewBranchEscaped) {
        $NewBranchExistsOnRemote = $true
    }
}
$LocalBranches = $null
$LocalBranches = git branch -v
foreach ($LocalBranch in $LocalBranches) {
    if ($LocalBranch -match $NewBranchEscaped) {
        $NewBranchExistsOnLocal = $true
    }
}

# Checkout (if exists) or create branch
if ($NewBranchExistsOnRemote -and $NewBranchExistsOnLocal) {
    & git checkout $NewBranch
    & git pull
}
elseif ($NewBranchExistsOnRemote) {
    & git pull
    & git checkout $NewBranch
}
elseif ($NewBranchExistsOnLocal) {
    & git checkout $NewBranch
}
else {
    & git checkout -b $NewBranch
}


# -----RENAME-----

foreach ($Renaming in $Renamings) {
    $Pattern = $null
    $Replace = $null
    $Found = $null
    $CommitMessage = $null

    $Pattern = $Renaming.Pattern
    $Replace = $Renaming.Replace

    $IsSubPackageOrModule = $false
    if ($Renaming.Variable) {
        $IsSubPackageOrModule = ($Renaming.Variable -match "SubPackage|Module")
    }

    $IsAuthorAttribute = $false
    if ($Renaming.Variable) {
        $IsAuthorAttribute = ($Renaming.Variable -match "Author")
    }

    $IsMaintainerAttribute = $false
    if ($Renaming.Variable) {
        $IsMaintainerAttribute = ($Renaming.Variable -match "Maintainer")
    }

    $IsKeyword = $false
    if ($Renaming.Variable) {
        $IsKeyword = ($Renaming.Variable -match "Keyword")
    }

    if (($Replace) -and ($Replace -eq $Pattern)) {
        Continue
    }

    $Pattern = [regex]::Escape($Pattern)  # Escape special characters

    # Replace occurrences of $Pattern with $Replace in all..

    # ..folder names:
    $Folders = $null
    $Folders = Get-ChildItem -Recurse -Directory -Exclude $Exclude | Where-Object { $_.Name -match $Pattern }
    if ($Replace) {
        $Folders | Rename-Item -NewName { $_.Name -replace $Pattern, $Replace }
    }
    else {
        $Folders | Remove-Item -Recurse
    }

    # ..file names:
    $Files = $null
    $Files = Get-ChildItem -Recurse -File -Exclude $Exclude | Where-Object { $_.Name -match $Pattern }
    if ($Replace) {
        $Files | Rename-Item -NewName { $_.Name -replace $Pattern, $Replace }
    }
    else {
        $Files | Remove-Item
    }

    # ..file content
    $Files = $null
    $Files = Get-ChildItem -Recurse -File -Exclude $Exclude
    foreach ($File in $Files) {
        $NeedsFullLineRemoval = $false
        if (-not ($Replace)) {
            # Some replacements need special handling -> Do not remove just the value, but the whole line.
            if ($IsSubPackageOrModule -and ($File.FullName -match "docs\\source\\\w+\.rst")) {
                # Removing subpackage or module in an *.rst file inside docs/source
                $NeedsFullLineRemoval = $true
            }
            if ($IsAuthorAttribute -and ($File.Name -match "(pyproject\.toml|README\.md)$")) {
                # Removing author attributes in pyproject.toml or README.md
                $NeedsFullLineRemoval = $true
            }
            if ($IsMaintainerAttribute -and ($File.Name -match "pyproject\.toml")) {
                # Removing maintainer attributes in pyproject.toml
                $NeedsFullLineRemoval = $true
            }
            if ($IsKeyword -and ($File.Name -match "(pyproject\.toml|CITATION\.cff)$")) {
                # Removing keywords in pyproject.toml or CITATION.cff
                $NeedsFullLineRemoval = $true
            }
        }
        if ($NeedsFullLineRemoval) {
            $Lines = $null
            # Read file line-by-line
            $Lines = Get-Content $File
            # Filter out lines that match the pattern
            $FilteredLines = $Lines | Where-Object { $_ -notmatch $Pattern }
            if ($FilteredLines.Length -lt $Lines.Length) {
                # At least one line was removed.
                # -> Write filtered lines back to file.
                $MatchingLines = $Lines | Where-Object { $_ -match $Pattern }
                $Found = $MatchingLines.ToString()
                $FilteredLines | Set-Content $File
            }
        }
        else {
            $Content = $null
            # Read file content as block
            $Content = Get-Content $File -Raw
            if ($Content -match $Pattern) {
                # At least one occurrence of the pattern was found.
                # -> Replace all occurrences of the pattern with the replacement.
                $Found = $Matches[0]
                $Content -Replace $Pattern, $Replace | Set-Content $File -NoNewline
            }
        }
    }

    # Commit changes
    $CommitMessage = ""
    if ($Replace) {
        $CommitMessage = "Renamed $Found to $Replace"
    }
    else {
        $CommitMessage = "Removed $Found"
    }
    Write-Host "Commit: $CommitMessage"
    & git add .
    & git commit -m $CommitMessage
}

# Save applied names in a CSV file
$Names = @()
foreach ($Renaming in $Renamings) {
    if (-not $Renaming.Variable) {
        Continue
    }
    $Name = @{
        Variable = $Renaming.Variable
        Value    = $Renaming.Replace
    }
    $Names += $Name
}
Write-Host "Save names in CSV file: $NamesFile"
if (-not (Test-Path $NamesFile)) {
    $CommitMessage = "Added $NamesFileName documenting the names applied."
}
else {
    $CommitMessage = "Updated $NamesFileName documenting the names applied."
}
$Columns = "Variable", "Value"
$Columns -join "," | Set-Content -Path $NamesFile -Force
$Names | Export-Csv -Path $NamesFile -UseQuotes AsNeeded
Write-Host "Commit: $CommitMessage"
& git add .
& git commit -m $CommitMessage

# Restore the original README.md
$README = "$Folder\README.md"
$_README = "$Folder\_README.md"

if ((Test-Path $README) -and (Test-Path $_README)) {
    Write-Host "Remove the temporary README.md containing the instructions on how to use the template."
    Remove-Item $README
    $CommitMessage = "Removed the temporary README.md containing the instructions on how to use the template."
    Write-Host "Commit: $CommitMessage"
    & git add .
    & git commit -m $CommitMessage

    Write-Host "Restore the original README.md"
    Rename-Item -Path $_README -NewName "README.md"
    $CommitMessage = "Restored the original README.md"
    Write-Host "Commit: $CommitMessage"
    & git add .
    & git commit -m $CommitMessage
}

# -----CLEAN UP-----

# Push branch to remote (if requested)
if ($PushToRemote) {
    Write-Host "Push branch $NewBranch to remote"
    & git push origin $NewBranch
    # Create a pull request on GitHub by visiting
    # $RemoteUrl/pull/new/$NewBranch
}

# Change back to original branch and delete new branch (if requested)
if (-not $StayOnNewBranch -and ($NewBranch -ne $OriginalBranch)) {
    # Change back to original branch
    & git checkout $OriginalBranch
    # Delete new branch on local
    if ($PushToRemote) {
        Write-Host "Delete local branch $NewBranch"
        & git branch -D $NewBranch
    }
}

# Re-apply uncommited changes in working tree which had been stash'ed before
if ($StashedWorkingTree) {
    & git stash pop
}

Set-Location $Cwd

Write-Host ""
Write-Host "Finished: $JobName"
Write-Host ""
