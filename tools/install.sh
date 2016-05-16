#!/bin/sh

set -e

if [[ $TRAVIS_BRANCH =~ "release/" ]]; then
	sudo apt-get install -o Dpkg::Options::="--force-confold" --force-yes -y docker-engine
	git checkout origin/$TRAVIS_BRANCH
	curl -L --silent --output /home/travis/build/Jbbouille/github-release.tar.bz2 https://github.com/aktau/github-release/releases/download/v0.6.2/linux-amd64-github-release.tar.bz2
	tar xf /home/travis/build/Jbbouille/github-release.tar.bz2 -C /home/travis/build/Jbbouille/
fi