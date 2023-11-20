# Master Packager Dev Docker Action

[![Build and Push Docker Container](https://github.com/oleksis/setup-mpdev/actions/workflows/build-and-push.yml/badge.svg)](https://github.com/oleksis/setup-mpdev/actions/workflows/build-and-push.yml)
[![Packaging .NET app to MSI/MSIX with MPDev](https://github.com/oleksis/setup-mpdev/actions/workflows/test.yml/badge.svg)](https://github.com/oleksis/setup-mpdev/actions/workflows/test.yml)

Setup Master Packager Dev Docker Action

## Inputs

`mpdev-params`

**Required** List of parameters for mpdev

## Example usage

```yaml
uses: github.com/oleksis/setup-mpdev@v1
with:
  mpdev-params: "['build', 'apptest/mpdev.json', '--verbose']"
```

See more in [test.yml](https://github.com/oleksis/setup-mpdev/blob/main/.github/workflows/test.yml)

## How to use the Dockerfile

- Build the image and create MSI/MSIX

```pwsh
docker build -t mpdev .
docker run --name mpdev-cli -it --workdir /src -v C:\path\to\your\src\directory:C:\src mpdev build build/msi/project_mpdev.json
```

- New container with interactive terminal typing using cmd

```pwsh
docker run --name mpdev-cli -it --entrypoint cmd.exe --workdir /src -v .:C:/src mpdev

C:\src>mpdev help
```

## How to use GitHub Container Registry

[Github Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

- [setup-mpdev](https://github.com/oleksis/setup-mpdev/pkgs/container/setup-mpdev)

```pwsh
docker run --name mpdev-hello -i --workdir /src -v .:C:\src ghcr.io/oleksis/setup-mpdev:v1 build apptest/mpdev.json --verbose
```

## Links

- [How to install MSI on Windows Container](https://techadviz.com/install-msi-on-container/)
- [Get started: Run your first Windows container](https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container)
- [Windows Containers side by side with Rancher Desktop - for windows containers implementation ideas](https://github.com/rancher-sandbox/rancher-desktop/issues/3999)
- [Golang Docker library](https://github.com/docker-library/golang/blob/d1ff31b86b23fe721dc65806cd2bd79a4c71b039/1.21/windows/nanoserver-ltsc2022/Dockerfile#L20C1-L20C1)
