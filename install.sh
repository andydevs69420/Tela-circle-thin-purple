#!/bin/bash


if [[ $(whoami) != "root" ]];
then
	echo "Installing locally at \"~/.local/share/icons\"...";
	if [[ $(ls ~/.local/share | grep "icons") != "icons" ]];
	then
		mkdir ~/.local/share/icons;
	fi
	# make dir for dark
	if [[ $(ls ~/.local/share/icons | grep "Tela-circle-thin-purple-dark") != "Tela-circle-thin-purple-dark" ]];
        then
			mkdir ~/.local/share/icons/Tela-circle-thin-purple-dark;
        fi
	# make dir for dark
        if [[ $(ls ~/.local/share/icons | grep "^Tela-circle-thin-purple$") != "Tela-circle-thin-purple" ]];
        then
			mkdir ~/.local/share/icons/Tela-circle-thin-purple;
        fi
	# finally copy default
	cp -r * ~/.local/share/icons/Tela-circle-thin-purple/;
	# finally copy dark
        cp -r UNPACK-DARK/* ~/.local/share/icons/Tela-circle-thin-purple-dark/;
	# update
	chown -R $USER:$USER ~/.local/share/icons/Tela-*;
	update-icon-caches ~/.local/share/icons/*;
	gtk-update-icon-cache ~/.local/share/icons/*;

else
	echo "Installing netwide...";
	# make dir for dark
	if [[ $(ls /usr/share/icons | grep "Tela-circle-thin-purple-dark") != "Tela-circle-thin-purple-dark" ]];
	then
		mkdir /usr/share/icons/Tela-circle-thin-purple-dark;
	fi
	# make dir for dark
	if [[ $(ls /usr/share/icons | grep "^Tela-circle-thin-purple$") != "Tela-circle-thin-purple" ]];
	then
		mkdir /usr/share/icons/Tela-circle-thin-purple;
	fi
	# finally copy default
	cp -r * /usr/share/icons/Tela-circle-thin-purple/;
	# finally copy dark
	cp -r UNPACK-DARK/* /usr/share/icons/Tela-circle-thin-purple-dark/;
	# update
	chown -R root:root /usr/share/icons/Tela-*;
	update-icon-caches /usr/share/icons/*;
	gtk-update-icon-cache /usr/share/icons/*;

fi
echo "Install finished!";
exit;
