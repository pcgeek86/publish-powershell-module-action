FROM mcr.microsoft.com/powershell

ADD ["entrypoint.ps1", "/data/"]

RUN chmod +x /data/entrypoint.ps1 \
    && apt-get update \
    && apt-get install apt-transport-https wget --yes \
    && wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install --yes dotnet-sdk-5.0


ENTRYPOINT ["/data/entrypoint.ps1"]
