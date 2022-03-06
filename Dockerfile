FROM ghcr.io/linuxserver/baseimage-rdesktop:alpine

# set version label
ARG BUILD_DATE
ARG VERSION
ARG ICEWM_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"


RUN \
  echo "**** install packages ****" && \
  apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    icewm && \
  apk add --no-cache \
    firefox \
    font-noto \
    xterm && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3389
VOLUME /config
