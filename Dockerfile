FROM ubuntu:latest

ENV DEBIAN_FRONTEND="noninteractive" \
	TZ="America/Toronto" \
	TERM="xterm"

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		apt-transport-https \
		apt-utils\
		ca-certificates \
		bash \
		curl \
		dialog\
		debconf-utils\
		inotify-tools \
		locales \
		man \
		manpages \
		mc \
		nano \
		pwgen \
#		supervisor \
		tzdata\
#		unrar \
		unzip \
		wget \
	&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	echo $TZ > /etc/timezone && \
	dpkg-reconfigure -f noninteractive tzdata && \
	locale-gen fr_CA.UTF-8
	update-locale LANG=fr_CA.UTF-8
##	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
##	echo "fr_CA.UTF-8 UTF-8" >> /etc/locale.gen && \
##	locale-gen && \
##	update-locale LANG=fr_CA.UTF-8
	echo 'alias ll="ls -lah --color=auto"' >> /etc/bash.bashrc 

##	echo -n > /var/lib/apt/extended_states
CMD ["/bin/bash"]
