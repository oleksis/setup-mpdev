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

RUN curl.exe -L -o mpdev_self_contained_x64_1.0.2.msi https://oleksis.github.io/setup-mpdev/download/mpdev_self_contained_x64_1.0.2.msi `
    && msiexec /i mpdev_self_contained_x64_1.0.2.msi /qn `
    && del /F mpdev_self_contained_x64_1.0.2.msi

# RUN curl -L -o dotnet-runtime-6.0.21-win-x64.exe https://oleksis.github.io/setup-mpdev/download/dotnet-runtime-6.0.21-win-x64.exe `
#     && dotnet-runtime-6.0.21-win-x64.exe /install /quiet /norestart `
#     && del /F dotnet-runtime-6.0.21-win-x64.exe

RUN mkdir C:\src

VOLUME C:\src
# WORKDIR /src

ENTRYPOINT ["mpdev.exe"]
