#!/usr/bin/env pwsh
$ErrorActionPreference = 'Stop'

$Modules = $null
if ([string]::IsNullOrWhiteSpace($env:INPUT_MODULEPATH)) {
    $Modules = Get-ChildItem -Recurse -Filter '*.psd1' |
        Select-Object -Unique -ExpandProperty Directory
} else {
    $Modules = @($env:INPUT_MODULEPATH)
}

$Modules | ForEach-Object {
    $Module = $_
    Write-Host "Publishing '$Module' to PowerShell Gallery"

    Get-ChildItem -Path $_ -Filter '*.psd1' | ForEach-Object {
        Write-Host "`tProcessing $_..."
        envsubst --no-unset -i $_ -o $_
    }

    Publish-Module -Path $Module -NuGetApiKey $env:INPUT_NUGETAPIKEY
    Write-Host "'$Module' published!"
}
