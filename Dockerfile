# syntax=docker/dockerfile:1
ARG TAG_BUILD=10.0.20348.1
ARG TAG_FINAL=6.0.21-nanoserver-ltsc2022
# Image with msiexec
FROM mcr.microsoft.com/windows/servercore/insider:$TAG_BUILD as build

LABEL maintainer="Oleksis Fraga <oleksis.fraga at gmail.com>"
LABEL org.opencontainers.image.source=https://github.com/oleksis/setup-mpdev
LABEL org.opencontainers.image.description="Setup Master Packager Dev"
# LABEL org.opencontainers.image.licenses=MIT

RUN curl -L -o Master_Packager_Dev_1.0.1.msi https://oleksis.github.io/setup-mpdev/download/Master_Packager_Dev_1.0.1.msi \
    && msiexec /i Master_Packager_Dev_1.0.1.msi /qn \
    && del /F Master_Packager_Dev_1.0.1.msi

# final stage/image
FROM mcr.microsoft.com/dotnet/runtime:$TAG_FINAL
ENV MPDEV_HOME='C:\Program Files\Master Packager Dev\'

COPY --from=build ${MPDEV_HOME} ${MPDEV_HOME}

USER ContainerAdministrator
RUN setx /m PATH "%MPDEV_HOME%;%PATH%"
# USER ContainerUser

RUN mkdir C:\src

VOLUME C:/src
# WORKDIR /src

ENTRYPOINT ["mpdev.exe"]
