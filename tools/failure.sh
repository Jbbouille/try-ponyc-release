#!/bin/sh

if [[ $TRAVIS_BRANCH =~ "release/" && $RELEASE == "true" ]]; then
	git push origin :refs/tags/v$PONY_VERSION
	/home/travis/build/Jbbouille/bin/linux/amd64/github-release delete --user Jbbouille --repo try-ponyc-release --tag v$PONY_VERSION
fi