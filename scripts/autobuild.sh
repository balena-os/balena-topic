#!/bin/sh -e
git submodule update --init --recursive
./balena-yocto-scripts/build/barys --continue --development-image
