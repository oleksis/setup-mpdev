# syntax=docker/dockerfile:1
# escape=`
# Windows Servercore
ARG TAG_BUILD=10.0.20348.1
# Image with Windows Installer - msiexec
FROM mcr.microsoft.com/windows/servercore/insider:$TAG_BUILD as build

LABEL maintainer="Oleksis Fraga <oleksis.fraga at gmail.com>"
LABEL org.opencontainers.image.source=https://github.com/oleksis/setup-mpdev
LABEL org.opencontainers.image.description="Setup Master Packager Dev"
# LABEL org.opencontainers.image.licenses=MIT

RUN curl -L -o Master_Packager_Dev_1.0.1.msi https://oleksis.github.io/setup-mpdev/download/Master_Packager_Dev_1.0.1.msi `
    && msiexec /i Master_Packager_Dev_1.0.1.msi /qn `
    && del /F Master_Packager_Dev_1.0.1.msi

RUN curl -L -o dotnet-runtime-6.0.21-win-x64.exe https://oleksis.github.io/setup-mpdev/download/dotnet-runtime-6.0.21-win-x64.exe `
    && dotnet-runtime-6.0.21-win-x64.exe /install /quiet /norestart `
    && del /F dotnet-runtime-6.0.21-win-x64.exe

RUN mkdir C:\src

VOLUME C:\src
# WORKDIR /src

ENTRYPOINT ["mpdev.exe"]
