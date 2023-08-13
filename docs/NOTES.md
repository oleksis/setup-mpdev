# MPDEV Windows Container
```pwsh
docker build -t mpdev .
docker run -it --entrypoint cmd.exe --workdir /src -v .:C:/src mpdev
```

## Links
- [How to install MSI on Windows Container](https://techadviz.com/install-msi-on-container/)
- [Get started: Run your first Windows container](https://learn.microsoft.com/en-us/virtualization/windowscontainers/quick-start/run-your-first-container)
- [Windows Containers side by side with Rancher Desktop - for windows containers implementation ideas](https://github.com/rancher-sandbox/rancher-desktop/issues/3999)
