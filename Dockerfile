FROM lsiobase/ubuntu:bionic

ARG DEBIAN_FRONTEND="noninteractive"

ENV ASPNETCORE_URLS=http://+:7878\
    DOTNET_RUNNING_IN_CONTAINER=true \
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    NUGET_XMLDOC_MODE=skip \
    XDG_CONFIG_HOME="/config/xdg"
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update \
    && apt-get install -y libicu-dev libmediainfo-dev \
    && apt-get clean \
    && rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/* \
        /var/lib/apt/lists/* \
    && mkdir -p \
	/app/radarr/bin

COPY ./root /
COPY ./_artifacts/linux-x64/netcoreapp3.1/Radarr /app/radarr/bin
EXPOSE 7878
VOLUME /config
