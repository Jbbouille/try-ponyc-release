FROM ubuntu:xenial

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ARG TRAVIS_BRANCH

RUN apt-get update && \ 
	apt-get -y 	install build-essential git rubygems ruby-dev \
            	zlib1g-dev libncurses5-dev libssl-dev libpcre2-16-0 llvm-3.7-dev curl

RUN mkdir /home/pony

RUN git clone https://github.com/Jbbouille/try-ponyc-release.git /home/pony/ponyc
RUN git --git-dir /home/pony/ponyc/.git checkout $TRAVIS_BRANCH
RUN git --git-dir /home/pony/ponyc/.git reset --hard origin/$TRAVIS_BRANCH

RUN curl -L --silent --output /home/pony/github-release.tar.bz2 https://github.com/aktau/github-release/releases/download/v0.6.2/linux-amd64-github-release.tar.bz2 && \
	tar xf /home/pony/github-release.tar.bz2 -C /home/pony/ && \
	cp /home/pony/bin/linux/amd64/github-release /usr/bin/

COPY main.sh /home/pony/

RUN gem install fpm

ENTRYPOINT bash /home/pony/main.sh