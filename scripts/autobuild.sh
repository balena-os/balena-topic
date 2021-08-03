#!/bin/sh -e
git submodule update --init --recursive
rm -rf build/artefacts
./scripts/coffeemaker.sh
./balena-yocto-scripts/build/barys --continue --development-image
mkdir -p build/artefacts
for m in t*.coffee
do
	MACHINE=`basename $m .coffee`
	xz -3 < build/tmp/deploy/images/${MACHINE}/balena-image-${MACHINE}.balenaos-img > build/artefacts/balena-image-${MACHINE}.balenaos-img.xz &
done
wait
