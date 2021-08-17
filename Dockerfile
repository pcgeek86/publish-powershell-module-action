FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

ADD ["entrypoint.ps1", "/data/"]

RUN chmod +x /data/entrypoint.ps1

ENTRYPOINT ["/data/entrypoint.ps1"]
