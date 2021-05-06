FROM ghcr.io/linuxserver/baseimage-rdesktop:alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	faenza-icon-theme \
	faenza-icon-theme-xfce4-appfinder \
	faenza-icon-theme-xfce4-panel \
	firefox-esr \
	font-noto \
	mousepad \
	thunar \
	xfce4 \
	xfce4-terminal && \
 apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
	xfce4-pulseaudio-plugin && \
 echo "**** cleanup ****" && \
 rm -rf \
        /tmp/*

# add local files
COPY /root /
