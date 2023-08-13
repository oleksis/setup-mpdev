# syntax=docker/dockerfile:1
# ARG TAG=ltsc2022
ARG TAG=10.0.20348.1
# FROM mcr.microsoft.com/windows/nanoserver:$TAG AS build
FROM mcr.microsoft.com/windows/servercore/insider:$TAG

RUN curl -L -o Master_Packager_Dev_1.0.1.msi https://oleksis.github.io/setup-mpdev/download/Master_Packager_Dev_1.0.1.msi && curl -L -o dotnet-runtime-6.0.21-win-x64.exe https://oleksis.github.io/setup-mpdev/download/dotnet-runtime-6.0.21-win-x64.exe

RUN dotnet-runtime-6.0.21-win-x64.exe /install /quiet /norestart && del /F dotnet-runtime-6.0.21-win-x64.exe

RUN msiexec /i Master_Packager_Dev_1.0.1.msi /qn && del /F Master_Packager_Dev_1.0.1.msi

RUN mkdir C:\src
VOLUME C:/src
# WORKDIR /src

CMD ["mpdev.exe"]

