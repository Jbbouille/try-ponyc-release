#!/bin/sh

if [[ $TRAVIS_BRANCH =~ "release/" ]]; then
	docker pull jbbouille/ponyc-arch
	docker pull jbbouille/ponyc-ubuntu
	docker pull jbbouille/ponyc-fedora

	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH -e GITHUB_TOKEN=$GITHUB_TOKEN -e PONY_VERSION=$PONY_VERSION ponyc-arch
	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH -e GITHUB_TOKEN=$GITHUB_TOKEN -e PONY_VERSION=$PONY_VERSION ponyc-ubuntu
	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH -e GITHUB_TOKEN=$GITHUB_TOKEN -e PONY_VERSION=$PONY_VERSION ponyc-fedora
	exit 0
fi