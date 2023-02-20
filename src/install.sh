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
mv $HOME/.icons/Nordzy-cursors* $HOME/.local/share/icons/ &&
	# If ~/.icons is empty, delete it
	[ "$(ls -A $HOME/.icons)" ] || rm -fr $HOME/.icons

if [ !-d $HOME/.config/alacritty ]; then
	mkdir -p $HOME/.config/alacritty
fi

cp $BASEDIR/config/alacritty/alacritty.yml $HOME/.config/alacritty/

if [ !-d $HOME/.config/blender/3.4/scripts/presets/interface_theme ]; then
	mkdir -p $HOME/.config/blender/3.4/scripts/presets/interface_theme
fi

cp $BASEDIR/config/blender/blender-nord_dark.xml $HOME/.config/blender/3.4/scripts/presets/interface_theme/

if [ !-d $HOME/.config/helix ]; then
	mkdir -p $HOME/.config/helix
fi

cp -r $BASEDIR/config/helix/* $HOME/.config/helix/

if [ !-d $HOME/.config/zellij ]; then
	mkdir -p $HOME/.config/zellij
fi

cp $BASEDIR/config/zellij/config.kdl $HOME/.config/zellij/
