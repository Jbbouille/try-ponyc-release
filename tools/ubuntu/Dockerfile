FROM ubuntu:xenial

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ARG TRAVIS_BRANCH

RUN apt-get update && \ 
	apt-get -y 	install build-essential git rubygems ruby-dev \
            	zlib1g-dev libncurses5-dev libssl-dev libpcre2-16-0 llvm-3.7-dev

RUN mkdir /home/pony

RUN git clone https://github.com/Jbbouille/try-ponyc-release.git /home/pony/ponyc

RUN git --git-dir /home/pony/ponyc/.git checkout $TRAVIS_BRANCH

COPY main.sh /home/pony/

RUN gem install fpm

ENTRYPOINT bash /home/pony/main.sh