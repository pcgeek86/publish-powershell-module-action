#!/usr/bin/env pwsh

Write-Host $env:INPUT_MODULEPATH
Write-Host hi
#Publish-Module -Path $env:MODULE_PATH -NuGetApiKey $env:NUGET_API_KEY