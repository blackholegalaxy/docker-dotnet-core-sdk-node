FROM mcr.microsoft.com/dotnet/core/sdk:2.2

RUN apt-get update && \
    apt-get install -y ca-certificates git openssh-client apt-transport-https dirmngr gnupg && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update && \
    apt-get install -y nodejs yarn mono-devel && \
    curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe && \
    rm -rf /var/lib/apt/lists/*

COPY aliases.sh /etc/profile.d/aliases.sh
CMD ["/bin/bash", "-l"]
