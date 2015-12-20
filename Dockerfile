FROM debian:jessie

ENV DEBIAN_FRONTEND="noninteractive" \
#	LANG="fr_CA.UTF-8" \
#	LC_ALL="fr_CA.UTF-8" \
#	LANGUAGE="fr_CA.UTF-8" \
	TZ="America/Toronto" \
	TERM="xterm"

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		apt-transport-https \
		apt-utils\
		bash \
		bash-completion \
		ca-certificates \
		curl \
		dialog\
		debconf-utils\
		gettext \
		inotify-tools \
		locales \
		logrotate \
		man \
		manpages \
		mc \
		nano \
		ncurse \
		pwgen \
		rsync \
		supervisor \
		tar \
		tzdata\
#		unrar \
		unzip \
		vim \
		wget \
		zlib \
	&& \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo $TZ > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo 'alias ll="ls -lah --color=auto"' >> /etc/bash.bashrc  && \
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
	echo "fr_CA.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen && \
	update-locale LANG=fr_CA.UTF-8

##	echo -n > /var/lib/apt/extended_states
ENTRYPOINT exec /bin/bash
