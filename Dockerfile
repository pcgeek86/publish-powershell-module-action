FROM microsoft/powershell

ADD ["entrypoint.ps1", "/data/"]

RUN chmod +x /data/entrypoint.ps1

ENTRYPOINT ["/data/entrypoint.ps1"]
