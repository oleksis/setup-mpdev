FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN curl -L -o Master_Packager_Dev_1.0.1.msi https://oleksis.github.io/setup-mpdev/download/Master_Packager_Dev_1.0.1.msi

RUN msiexec /i Master_Packager_Dev_1.0.1.msi /qn

CMD ["mpdev.exe"]

