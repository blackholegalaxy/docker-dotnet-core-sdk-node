FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine3.9

RUN apk add --no-cache nodejs>=10.14.2 yarn>=1.12.0
