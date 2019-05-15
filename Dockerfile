FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine3.9

RUN apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache --virtual=.build-dependencies ca-certificates curl && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
    curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
    apk del .build-dependencies && \
    apk add --no-cache nodejs~=10.14.2 yarn~=1.12.3 git ca-certificates openssh-client

COPY aliases.sh /etc/profile.d/aliases.sh
CMD ["/bin/sh", "-l"]
