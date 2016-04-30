#!/bin/sh

if [[ $TRAVIS_BRANCH =~ "release/" ]]; then
	docker build --build-arg TRAVIS_BRANCH=$TRAVIS_BRANCH -t ponyc-arch /home/travis/build/Jbbouille/try-ponyc-release/tools/archlinux/
	docker build --build-arg TRAVIS_BRANCH=$TRAVIS_BRANCH -t ponyc-ubuntu /home/travis/build/Jbbouille/try-ponyc-release/tools/ubuntu/
	docker build --build-arg TRAVIS_BRANCH=$TRAVIS_BRANCH -t ponyc-red-hat /home/travis/build/Jbbouille/try-ponyc-release/tools/red-hat/

	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH GITHUB_TOKEN=$GITHUB_TOKEN PONY_VERSION=$PONY_VERSION ponyc-arch
	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH GITHUB_TOKEN=$GITHUB_TOKEN PONY_VERSION=$PONY_VERSION ponyc-ubuntu
	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH GITHUB_TOKEN=$GITHUB_TOKEN PONY_VERSION=$PONY_VERSION ponyc-red-hat
	exit 0
fi