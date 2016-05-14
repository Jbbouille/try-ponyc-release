#!/bin/sh

set -e

if [[ $TRAVIS_BRANCH =~ "release/" && $RELEASE == "true" ]]; then
	git tag v$PONY_VERSION
	git push -q https://$GITHUB_TOKEN@github.com/Jbbouille/try-ponyc-release --tags
	/home/travis/build/Jbbouille/bin/linux/amd64/github-release release --user Jbbouille --repo try-ponyc-release --tag v$PONY_VERSION --name "Ponyc release draft" --description "Ponyc release draft $PONY_VERSION" --draft 
	
	docker pull jbbouille/ponyc-arch
	docker pull jbbouille/ponyc-ubuntu
	docker pull jbbouille/ponyc-fedora

	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH -e GITHUB_TOKEN=$GITHUB_TOKEN -e PONY_VERSION=$PONY_VERSION jbbouille/ponyc-arch
	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH -e GITHUB_TOKEN=$GITHUB_TOKEN -e PONY_VERSION=$PONY_VERSION jbbouille/ponyc-ubuntu
	docker run -e TRAVIS_BRANCH=$TRAVIS_BRANCH -e GITHUB_TOKEN=$GITHUB_TOKEN -e PONY_VERSION=$PONY_VERSION jbbouille/ponyc-fedora
fi