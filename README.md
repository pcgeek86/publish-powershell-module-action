## Publish PowerShell Module

This GitHub Action enables you to publish a PowerShell module to the [PowerShell Gallery](https://powershellgallery.com).

## Usage

1. Add a GitHub Actions Workflow configuration to your GitHub project, under `.github/workflows/main.yml`
2. Configure a secret on your GitHub repository, containing your PowerShell Gallery NuGet API key
3. Add the following step to your GitHub Actions job

For example, if you named your secret `PS_GALLERY_KEY`:

```yaml
      - name: Publish Module to PowerShell Gallery
        uses: pcgeek86/publish-powershell-module-action@v20
        id: publish-module
        with:
          NuGetApiKey: ${{ secrets.PS_GALLERY_KEY }}
```

## Assumptions

* You're writing a PowerShell script module (not a compiled module)
* Your module is contained within a subfolder of your GitHub repository

## Features

### Environment Variable Substitution

The deployment container includes [envsubst](https://github.com/a8m/envsubst#docs)
to support environment variable usage in `.psd1` files.  See below for examples.

#### Auto-increment patch version

```powershell
    # Version number of this module.
    ModuleVersion = '1.0.${GITHUB_RUN_NUMBER}'
```

This will cause the patch version of the module to be automatically incremented each time the project builds.

#### Project paths

```powershell
    # A URL to the main website for this project.
    ProjectUri = 'https://github.com/${GITHUB_REPOSITORY}'

    # A URL to the license for this module.
    LicenseUri = 'https://github.com/${GITHUB_REPOSITORY}/blob/master/LICENSE'
```

#### Custom variables

GitHub actions support defining your own [environment variables](https://docs.github.com/en/actions/reference/environment-variables).

Examples:

* Externalize author, description, and/or copyright information
* Conditionally add [pre-release metadata](https://docs.microsoft.com/en-us/powershell/scripting/gallery/concepts/module-prerelease-support?view=powershell-7.1#identifying-a-module-version-as-a-prerelease)
  (e.g. if not building from mainline)
