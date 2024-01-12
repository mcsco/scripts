#!/bin/sh

mkdir -vp ~/Applications

cd ~/Downloads

wget "https://curseforge.overwolf.com/downloads/curseforge-latest-linux.zip"

unzip curseforge-latest-linux

mv ~/Downloads/build/CurseForge* ~/Applications/

# Cleanup
rmdir ~/Downloads/build
rm ~/Downloads/curseforge-latest-linux.zip
