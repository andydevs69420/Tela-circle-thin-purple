#!/bin/bash

for i in $(ls -lah | grep "../apps" | tr ' ' '\n' | grep "../apps"); 
do
#	echo $i;
	cp ../../apps/scalable/$(echo $(echo $i | grep -o -P '(?<=../apps/).*(?=$)')) ../apps;
done;

sudo update-icon-caches -f -v /usr/share/icons*
sudo gtk-update-icon-cache -f -v /usr/share/icons/*


sudo update-icon-caches -f -v ~/.local/share/icons*
sudo gtk-update-icon-cache -f -v ~/.local/share/icons/*

