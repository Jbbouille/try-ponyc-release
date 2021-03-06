#!/bin/bash

set -e

make config=release -C /home/pony/ponyc

if [[ $? -ne 0 ]]; then
	echo "Error during the building of Pony"
	exit 1
fi

/home/pony/ponyc/build/release/ponyc /home/pony/ponyc/examples/helloworld
if [[ $? -ne 0 ]]; then
	echo "Error during the building of Pony"
	exit 1
fi

HELLO_WORLD=$(/helloworld)
if [[ $HELLO_WORLD != "Hello, world." ]]; then
	echo "Error during the building of Pony"
	exit 1
fi

mkdir -p /home/pony/ponyc-$PONY_VERSION/usr/bin
mkdir -p /home/pony/ponyc-$PONY_VERSION/usr/lib
cp /home/pony/ponyc/build/release/ponyc /home/pony/ponyc-$PONY_VERSION/usr/bin
cp /home/pony/ponyc/build/release/libponyc.a /home/pony/ponyc-$PONY_VERSION/usr/lib
cp /home/pony/ponyc/build/release/libponyrt.a /home/pony/ponyc-$PONY_VERSION/usr/lib

ruby ~/.gem/ruby/2.3.0/gems/fpm-1.5.0/bin/fpm -s dir -t pacman -n ponyc -v $PONY_VERSION -C /home/pony/ponyc-$PONY_VERSION/
if [[ $? -ne 0 ]]; then
	echo "Error during the building of Pony"
	exit 1
fi

pacman -U --noconfirm ponyc-$PONY_VERSION-1-x86_64.pkg.tar.xz
if [[ $? -ne 0 ]]; then
	echo "Error during the building of Pony"
	exit 1
fi

ponyc -v
if [[ $? -ne 0 ]]; then
	echo "Error during the building of Pony"
	exit 1
fi

pacman -R --noconfirm ponyc
if [[ $? -ne 0 ]]; then
	echo "Error during the building of Pony"
	exit 1
fi

if [[ $TRAVIS_COMMIT =~ "Pony Release " ]]; then
	IFS=' ' read -a splitCommit <<< "${TRAVIS_COMMIT}"
	if [[ ${splitCommit[2]} != $PONY_VERSION ]]; then
		echo "Error during the building of Pony"
		exit 1		
	fi
	
	github-release upload \
	    --user Jbbouille \
	    --repo try-ponyc-release \
	    --tag v$PONY_VERSION \
	    --name ponyc-$PONY_VERSION-x86_64.pkg.tar.xz \
	    --file ponyc-$PONY_VERSION-1-x86_64.pkg.tar.xz
	if [[ $? -ne 0 ]]; then
		echo "Error during the building of Pony"
		exit 1
	fi
fi