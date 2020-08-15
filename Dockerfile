# escape=`
# Base Image
FROM mcr.microsoft.com/windows/servercore:ltsc2016

LABEL   Description="This image is used to execute LoadRunner Developer scripts in Windows. It uses DevWeb as its backbone." `
        Maintainer="NaveenKumar Namchivayam" `
        Vendor="QAInsights.com"
        
# Powershell
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Copying contents from host to container   
COPY / /

# Installing Visual Studio 2015 Redistributable Package
# After installing it, it will remove the exe file

RUN Invoke-WebRequest 'https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe' -OutFile 'vc_redist.x64.exe'; `
    Start-Process '.\vc_redist.x64.exe' '/install /passive /norestart' -Wait; `
    Remove-Item vc_redist.x64.exe;

# Download the LoadRunner Developer Package from https://marketplace.microfocus.com/appdelivery/content/loadrunner-developer
RUN Expand-Archive /LoadRunner_Developer_2020.2.zip -DestinationPath /LoadRunner_Developer_2020.2

# Set the working directory
WORKDIR C:\LoadRunner_Developer_2020.2\DevWeb

# Entrypoint
ENTRYPOINT ["powershell.exe", "/entrypoint.ps1"]