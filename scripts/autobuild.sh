#!/bin/sh -e
git submodule update --init --recursive
# Clean old build
rm -rf build/tmp
rm -rf build/artefacts

# prepare for balena-build
mkdir -p ~/.balena/
touch ~/.balena/token
mkdir -p build/artefacts

for m in t*.coffee
do
	MACHINE=`basename $m .coffee`
	./balena-yocto-scripts/build/balena-build.sh -d ${MACHINE} -s ~/shared_downloads_and_sstate
	xz -3 < build/tmp/deploy/images/${MACHINE}/balena-image-${MACHINE}.balenaos-img > build/artefacts/balena-image-${MACHINE}.balenaos-img.xz &
done
wait
