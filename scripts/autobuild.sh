#!/bin/sh -e
git submodule update --init --recursive
# Clean old build
rm -rf build/tmp
rm -rf build/artefacts

# prepare for balena-build
mkdir -p ~/.balena/
touch ~/.balena/token
mkdir -p build/artefacts

for m in *.coffee
do
	MACHINE=`basename $m .coffee`
	./balena-yocto-scripts/build/balena-build.sh -d ${MACHINE} -i balena-image -s ~/shared_downloads_and_sstate
	./balena-yocto-scripts/build/balena-build.sh -d ${MACHINE} -i balena-image-flasher -s ~/shared_downloads_and_sstate
	xz -3 < build/tmp/deploy/images/${MACHINE}/balena-image-${MACHINE}.balenaos-img > build/artefacts/balena-image-${MACHINE}.balenaos-img.xz &
	xz -3 < build/tmp/deploy/images/${MACHINE}/balena-image-flasher-${MACHINE}.balenaos-img > build/artefacts/balena-image-flasher-${MACHINE}.balenaos-img.xz &
done
wait
