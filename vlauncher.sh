#!/bin/bash
# vine_boom_sfx for .local/bin
if [ "$(cat ~/.vls)" = "" ]; then
	echo "vlauncher version 1"
fi

if [ "$1" = "s" ]; then
	# setup vlauncher and vine_boom_sfx
	if [ "$2" = "h" ]
	then
		#setup home
		
		cd $3
		mkdir settings
		cd settings
		
		cd ~
		echo "$3" > .vls
		ln -s .vls $3/settings/vlsettings
		echo "$4" > base
		
	fi
	
elif [ "$1" = "-x" ]; then
	echo "ping"
else
		
	cd $(cat ~/.vls)
	export vbs=$(pwd)
	
	./vine_boom_sfx.pdf.exe.py.sh $1 $2 $3 $4

fi
