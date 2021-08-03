#!/bin/sh -e
git submodule update --init --recursive
./scripts/coffeemaker.sh
./balena-yocto-scripts/build/barys --continue --development-image
