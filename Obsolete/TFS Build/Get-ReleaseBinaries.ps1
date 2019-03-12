Param(

    [Parameter(Mandatory = $True)] [String] $TargetFolder,
    [Parameter(Mandatory = $True)] [String] $Platform,
    [Parameter(Mandatory = $True)] [String] $Configuration,
    [Parameter(Mandatory = $True)] [String] $Contents
)

Write-Host "Entering script Get-ReleaseBinaries.ps1"
Write-Host "TargetFolder = $TargetFolder"
Write-Host "Platform = $Platform"
Write-Host "Configuration = $Configuration"
Write-Host "Contents = $Contents"

if ($Configuration -eq "Release") {

    [String] $CurrentDirectory = Get-Location

    [String] $SourcePath = $CurrentDirectory + "\" + $Platform + "\" + $Configuration + "\" + $Contents
    [String] $TargetPath = $CurrentDirectory + "\" + $TargetFolder + "\"+ $Platform

    Write-Host "SourcePath = $SourcePath"
    Write-Host "TargetPath = $TargetPath"

    if ((Test-Path $TargetPath) -eq 0) {

        Write-Host "Creating target path $TargetPath..."
        MD $TargetPath
    }

    Write-Host "Copying content to $TargetPath..."
    Copy-Item $SourcePath -Destination $TargetPath
}

Write-Host "Leaving script Get-ReleaseBinaries.ps1"
