FROM microsoft/powershell

ADD ["entrypoint.sh", "/data/"]

ENTRYPOINT /data/entrypoint.sh
