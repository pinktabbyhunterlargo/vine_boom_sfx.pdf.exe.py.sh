#!/bin/bash
export ver=1


export src=$(pwd)
cd ~
export path=$(pwd)


# find environment
export un=$(uname -o)
if [ "$un" = "Android" ]
then
	if [ "$path" = "/data/data/com.termux/files/home" ]
	then
		#assume Termux
		export env="termux"
	else
		#assume emulated
		export env="mobile"
	fi
else
	#assume PC
	export env="pc"
fi


# it's function time!
#yaaaaayyyy.....



function update {
#check for updates, somehow

	if [ "$2" = "" ]
	then
		echo "provide current update file and retry"
	else

#big block so lower level
#idk what i would need to update, but future proofing

export ud=$(ls .update)


if [ "$ud" != "" ]
then
	rm -rf .update

fi

#wget $2

#time to read file
#export upd=$(sed '1!d' ud.sh)

echo "no update available"
fi
}


function help {

	echo "vine_boom_sfx.pdf.exe.py.sh"
	echo
	echo "-h, --help, help"
	echo "generic help dialog"
	echo
	echo "install"
	echo "installs programs from repositories"
	echo "requires 'install vine_boom_sfx'"
	echo
	echo "update"
	echo "updates repositories and programs"
	echo
	echo "bomb"
	echo "find out yourself."
}


function maininstall {

echo "Finding sources"
cd $src
export rep=$(ls -a | grep .repo)
ls -a | grep .repo
	
echo 
echo "Enter file name or link"
if [ "$rep" != "" ]
then
	echo "Or choose above ($src)"
fi
	
read ch

export file=$(cat $ch)

if [ "$file" = "cat: $ch: No such file or directory" ]
then
	wget $ch
fi

}


function bomb {
	f
	a
	adfds[sa[s[f[[[f[as]]]]]]
	sdfs[[[f[s[fs]d]s]ds]]d]
}
if [ "$1" = "-b" ]
then
	bomb
fi

function search {
	export se=$2
	export rs=$(cat $ls | grep -c $se)
	
	
	cat $ls | grep $se
	echo "$rs results found"

}


function s-inst {
	search
	
	if (($rs > 1))
	then
		echo "There are multiple packages."
		echo "Choose a package of following:"
		cat $ls | grep -n $se
		echo "[number or name]"
		read mse
	fi
	
	if (($se > 1))
	then	
		wget $(sed '$se!d' pkg-list.txt) # i assure you this was not intentional

