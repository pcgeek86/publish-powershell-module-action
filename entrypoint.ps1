#!/usr/bin/env pwsh

Write-Host $env:INPUT_MODULEPATH
Write-Host $env:INPUT_NUGETAPIKEY

Get-ChildItem -Path env:
Write-Host -Object ('Publishing module ({0}) to PowerShell Gallery' -f $env:INPUT_MODULEPATH)

Get-ChildItem -Path $env:GITHUB_WORKSPACE
Import-Module -Name $env:GITHUB_WORKSPACE/$env:INPUT_MODULEPATH
Get-Module
Publish-Module -Name $env:INPUT_MODULENAME -NuGetApiKey $env:INPUT_NUGETAPIKEY
Write-Host -Object 'Finished publishing module to PowerShell Gallery'