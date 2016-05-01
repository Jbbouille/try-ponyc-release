#!/bin/sh

if [[ $TRAVIS_BRANCH =~ "release/" && $RELEASE == "true" ]]; then
	/home/travis/build/Jbbouille/bin/linux/amd64/github-release edit --user Jbbouille --repo try-ponyc-release --tag v$PONY_VERSION --name "Ponyc release" --description "Ponyc release $PONY_VERSION"
fi