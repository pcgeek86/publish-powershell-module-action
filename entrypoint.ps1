#!/usr/bin/env pwsh

Write-Host $env:INPUT_MODULEPATH
Write-Host $env:INPUT_NUGETAPIKEY

Get-ChildItem -Path env:
Write-Host -Object ('Publishing module ({0}) to PowerShell Gallery' -f $env:INPUT_MODULEPATH)

Get-ChildItem -Path $env:GITHUB_WORKSPACE | Format-Table -AutoSize
Get-Module | Format-Table -AutoSize

Publish-Module -Path $env:INPUT_MODULEPATH -NuGetApiKey $env:INPUT_NUGETAPIKEY
Write-Host -Object 'Finished publishing module to PowerShell Gallery'