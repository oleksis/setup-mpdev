# syntax=docker/dockerfile:1
# escape=`
# Windows Servercore
ARG TAG_BUILD=10.0.20348.1-amd64
# Image with Windows Installer - msiexec
FROM mcr.microsoft.com/windows/servercore/insider:$TAG_BUILD as build
# hadolint shell=powershell
LABEL maintainer="Oleksis Fraga <oleksis.fraga at gmail.com>"
LABEL org.opencontainers.image.source=https://github.com/oleksis/setup-mpdev
LABEL org.opencontainers.image.description="Setup Master Packager Dev"
LABEL org.opencontainers.image.licenses=MIT

SHELL [ "powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';" ]

RUN Invoke-WebRequest -Uri "https://github.com/MasterPackager/Master-Packager-Dev/releases/download/1.0.7/mpdev_self_contained_x64_1.0.7.msi" -OutFile "mpdev_self_contained_x64_1.0.7.msi"; `
    Start-Process msiexec.exe -ArgumentList '/i', 'mpdev_self_contained_x64_1.0.7.msi', '/qn' -NoNewWindow -Wait ; `
    Remove-Item -Force mpdev_self_contained_x64_1.0.7.msi

# RUN Invoke-WebRequest -Uri "https://oleksis.github.io/setup-mpdev/download/dotnet-runtime-6.0.21-win-x64.exe" -OutFile "dotnet-runtime-6.0.21-win-x64.exe" ; `
#     Start-Process dotnet-runtime-6.0.21-win-x64.exe -ArgumentList '/install', '/quiet', '/norestart' -NoNewWindow -Wait ; `
#     Remove-Item -Force dotnet-runtime-6.0.21-win-x64.exe

RUN New-Item -ItemType Directory -Force -Path C:\src

VOLUME C:\src
# WORKDIR /src

ENTRYPOINT ["mpdev.exe"]
