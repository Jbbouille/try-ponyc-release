FROM pritunl/archlinux:latest

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV GITHUB_TOKEN $GITHUB_TOKEN
ENV TRAVIS_BRANCH $TRAVIS_BRANCH
ENV PONY_VERSION $PONY_VERSION

RUN pacman --noconfirm -S pcre2 clang llvm llvm-libs ncurses gcc-libs zlib openssl make gcc ruby git

RUN mkdir /home/pony

RUN git clone https://github.com/Jbbouille/try-ponyc-release.git /home/pony/ponyc

RUN git checkout $TRAVIS_BRANCH

COPY main.sh /home/pony/

RUN gem install fpm

ENTRYPOINT bash /home/pony/main.sh