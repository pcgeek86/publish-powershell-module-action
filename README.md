## Publish PowerShell Module

This GitHub Action enables you to publish a PowerShell module to the [PowerShell Gallery](https://powershellgallery.com).

## Usage

1. Add a GitHub Actions Workflow configuration to your GitHub project, under `.github/workflows/main.yml`
2. Configure a secret on your GitHub repository, containing your PowerShell Gallery NuGet API key
3. Add the following step to your GitHub Actions job

For example, if you named your secret `PS_GALLERY_KEY`:

```
      - name: Publish Module to PowerShell Gallery
        uses: pcgeek86/publish-powershell-module-action@v20
        id: publish-module
        with:
          NuGetApiKey: ${{ secrets.PS_GALLERY_KEY }}
```

## Assumptions

* You're writing a PowerShell script module (not a compiled module)
* Your module is contained within a subfolder of your GitHub repository
