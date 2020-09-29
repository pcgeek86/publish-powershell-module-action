#!/usr/bin/env pwsh

Write-Host $env:modulePath
Write-Host $args[0]
Write-Host $args[1]
Write-Host hi
#Publish-Module -Path $env:MODULE_PATH -NuGetApiKey $env:NUGET_API_KEY