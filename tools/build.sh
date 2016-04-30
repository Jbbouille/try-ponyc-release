#!/bin/sh

echo 'before'
echo $TRAVIS_BRANCH
if [[ $TRAVIS_BRANCH =~ "release/" ]]; then
	echo 'IN'
	docker build -t ponyc-arch /home/travis/build/Jbbouille/try-ponyc-release/tools/archlinux/
	docker build -t ponyc-ubuntu /home/travis/build/Jbbouille/try-ponyc-release/tools/ubuntu/
	docker build -t ponyc-red-hat /home/travis/build/Jbbouille/try-ponyc-release/tools/red-hat/

	docker run ponyc-arch
	docker run ponyc-ubuntu
	docker run ponyc-red-hat
	exit 0
fi
echo 'after'