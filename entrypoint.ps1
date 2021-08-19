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
    $Module = $PSItem
    Write-Host -Object ('Publishing "{0}" to PowerShell Gallery' -f $Module)

    Get-ChildItem -Path $_ -Filter '*.psd1' | ForEach-Object {
        Write-Host -Object "`tProcessing $PSItem..." -ForegroundColor Green
        envsubst --no-unset -i $PSItem -o $PSItem
    }

    Publish-Module -Path $Module -NuGetApiKey $env:INPUT_NUGETAPIKEY
    Write-Host -Object "'$Module' published!"
}
