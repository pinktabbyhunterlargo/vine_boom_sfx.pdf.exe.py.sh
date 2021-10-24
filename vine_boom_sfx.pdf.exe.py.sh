#!/bin/bash
export ver=1

export src=$(pwd)
cd ~
export path=$(pwd)


# find environment
export un=$(uname -o)
if [ "$un" = "Android" ]; then
	if [ "$path" = "/data/data/com.termux/files/home" ]; then
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

if [ "$env" != "termux" ]; then
	export os=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)
fi

export root=$(pwd)
export pkgs="$(pwd)/settings/pkglist"
export ls="$root/repos/allpkgs"



# it's function time!
#yaaaaayyyy.....



function update {
	echo "no update available"
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
	echo "Installing vine_boom_sfx"
	echo
	echo "But first, a few questions."
	read -p "Install type [A uto, G uided, C ustom]: " itype
	
	if [ "$itype" = "a" ]; then
		read -p "Checking for git (any key to pause)" -t 3 git
		
		if [ "$git" != "" ]; then
			echo "Waiting, any key to continue"
			read
		fi
		
		#check for git
		
		export git=$(ls $PATH | grep git)
		if [ "$git" = "" ]; then
	
			export git=0
			
			if [ "$env" = "termux" ]; then
				apt install git -y
			fi
			
			if [ "$env" = "pc" ]; then
				if [[ "$os" = *"debian"* ]] || [[ "$os" = *"ubuntu"* ]]; then
					sudo apt install git -y
				fi
				if [ "$os" = "alpine" ]; then
					sudo apk add git
				fi
			fi
			
		fi
		
		echo "Git prepared"
		cd ~
		echo "Cloning repositories"
		git clone https://github.com/pinktabbyhunterlargo/vine_boom_sfx.pdf.exe.py.sh/
		mv vine_boom_sfx.pdf.exe.py.sh/ .vine/
		
		echo "Installing"
		mkdir -p ~/.local/bin
		cd ~/.local/bin
		cp ~/.vine/vlauncher.sh ~/.local/bin/
		mv vlauncher.sh vine_boom_sfx
		chmod +x vine_boom_sfx
		cd ~/.vine/repos
		chmod +x ~/.vine/vine_boom_sfx.pdf.exe.py.sh
		chmod +x *
		cd uninstall
		chmod +x *
		
		echo "Testing"
		vine_boom_sfx s h ~/.vine ~/.local/bin ~/.vine/vine_boom_sfx.pdf.exe.py.sh 
		vine_boom_sfx install test
		vine_boom_sfx update ~/.vine/tmp/
		vine_boom_sfx log
		
		
	fi
		

}


function bomb {
	f
	a
	adfds[sa[s[f[[[f[as]]]]]]
	sdfs[[[f[s[fs]d]s]ds]]d]
}
if [ "$1" = "bomb" ]; then
	bomb
fi

function search {
	export se=$2
	export rs=$(cat $ls | grep -c $se)
	
	
	cat $ls | grep $se
	echo "$rs results found"

}


function s-inst {

	if [ "$1" = "vine_boom_sfx" ]; then
		maininstall
	else
		echo "$1 $2"

	search
	
	if (( $rs > 1 )); then
		echo "There are multiple packages."
		echo "Choose a package of following:"
		cat $ls | grep $se
		read -p "[name]: " se 
	fi
	
	cd repos

	./$se.sh
	echo "$se" >> ../settings/pkglist

	fi

}

if [ "$1" = "install" ]; then
	s-inst $2
fi
if [ "$1" = "search" ]; then
	search $2
fi
if [ "$1" = "uninstall" ]; then
	uninstall $2
fi

function uninstall {
	export se=$2
	export rs=$(cat $pkgs | grep -c $se)
	cat $pkgs | grep $se
	echo "$rs results found"

	if (($rs > 1)); then
echo "Not specifc enough."
read -p "Choose a package above: " se
	fi

	cd repos
	cd uninstall
	./$se.sh
}
