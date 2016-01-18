FROM debian:jessie

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.11.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar xvzf /tmp/s6-overlay-amd64.tar.gz -C /

ENV DEBIAN_FRONTEND="noninteractive" \
	LANG="fr_CA.UTF-8" \
	LC_ALL="fr_CA.UTF-8" \
	LANGUAGE="fr_CA.UTF-8" \
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
#		ncurse \
		pwgen \
		rsync \
		supervisor \
		tar \
		tzdata\
#		unrar \
		unzip \
		vim \
		wget \
#		zlib \
	&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	echo $TZ > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata && \
##	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
##	echo "fr_CA.UTF-8 UTF-8" >> /etc/locale.gen && \
##	locale-gen && \
##	update-locale LANG="fr_CA.UTF-8" && \
	echo 'alias ll="ls -lah --color=auto"' >> /etc/bash.bashrc 
##	echo -n > /var/lib/apt/extended_states

ENTRYPOINT ["/init"]
