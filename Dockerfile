FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

# https://github.com/a8m/envsubst#linux-and-macos
RUN curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` -o envsubst && \
    chmod +x envsubst && \
    mv envsubst /usr/local/bin

ADD ["entrypoint.ps1", "/data/"]

RUN chmod +x /data/entrypoint.ps1

ENTRYPOINT ["/data/entrypoint.ps1"]
