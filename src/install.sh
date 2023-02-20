#!/bin/sh

CWDIR=$(readlink -f "$0")
BASEDIR=$(dirname "$CWDIR")

echo $BASEDIR

cd $BASEDIR/submodules/Graphite-gtk-theme
sh install.sh \
    --dest $HOME/.local/share/themes \
	--color dark \
	--tweaks nord normal \
	--libadwaita
sudo sh install.sh \
    --dest $HOME/.local/share/themes \
	--color dark \
	--tweaks nord normal \
	--gdm

cd $BASEDIR/submodules/Nordzy
sh install.sh \
    --dest $HOME/.local/share/icons \
    --color dark

cd $BASEDIR/submodules/Nordzy-cursors
sh install.sh
# Move the Nordzy cursor theme to ~/.local/share/icons
mv $HOME/.icons/Nordzy-cursors* $HOME/.local/share/icons/ && \
# If ~/.icons is empty, delete it
[ "$(ls -A $HOME/.icons)" ] || rm -fr $HOME/.icons