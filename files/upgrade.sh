#!/bin/bash
export root=$1
export version=$2
cd ..

if [ "$version" = "0.2b" ]; then

	mkdir tmp; cd tmp
	git clone https://github.com/pinktabbyhunterlargo/vine_boom_sfx.pdf.exe.py.sh/
	cp -ru repos/* ../repos/
	cp -ru vine_boom_sfx.pdf.exe.py.sh ..
	
	chmod +x ../repos/*
	chmod +x ../vine_boom_sfx.pdf.exe.py.sh
	cd $root; cd ..
	mv vine vine_boom_sfx
	cd vine_boom_sfx
	echo $(pwd) > ~/.vls
	cd tmp
	cp -ru files/* ../files/*
fi