#!/bin/sh

set -e

file=$(</home/jbpetit/work/Perso/ponyc/CHANGELOG.md)

IFS='## [' read -d '' -r -a changelog <<< $file
if [[ ${changelog[1]} == "" ]]; then
	echo "Error during the building of Pony"
	exit 1		
fi

echo "##${changelog[2]}"