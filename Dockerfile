FROM alpine:latest

MAINTAINER XtremXpert <xtremxpert@xtremxpert.com>

ENV LANG="fr_CA.UTF-8" \
	LC_ALL="fr_CA.UTF-8" \
	LANGUAGE="fr_CA.UTF-8" \
	TZ="America/Toronto" \
	TERM="xterm"

RUN apk update && \
	apk upgrade && \
	apk --update add \
		bash \
		bash-completion \
		ca-certificates \
		curl \
		gettext \
		logrotate \
		mc \
		nano \
		ncurses \
		openntpd \
		rsync \
		tar \
		unzip \
		vim \
		zlib \
	&& \
	ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
	rm -fr /var/lib/apk/* && \
	echo PS1='\[\e[0;35m\]AL\[\e[m\] \[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]' > /root/.bashrc && \
	rm -rf /var/cache/apk/*
