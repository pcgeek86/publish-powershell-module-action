#!/usr/bin/env pwsh

Write-Host "Publishing module ($env:INPUT_MODULEPATH) to PowerShell Gallery"

Publish-Module -Path $env:INPUT_MODULEPATH -NuGetApiKey $env:INPUT_NUGETAPIKEY
Write-Host 'Finished publishing module to PowerShell Gallery'
