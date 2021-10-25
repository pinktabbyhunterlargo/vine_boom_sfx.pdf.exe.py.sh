#!/bin/bash
export ver=1

bwht="\e[1;37m"
wht="\e[0;37m"
bblu="\e[1;34m"
blu="\e[0;34m"


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
	export osl=$(awk -F= '$1=="ID_LIKE" { print $2 ;}' /etc/os-release)
fi

export root=$(cat .vls)
export pkgs="$(pwd)/settings/pkglist"
export ls="$root/repos/allpkgs"
cd $root



# it's function time!
#yaaaaayyyy.....



function update {
	echo "no update available"
}


function help {

	echo -e "${bwht}vine_boom_sfx.pdf.exe.py.sh${wht}"
	echo
	echo "-h, --help, help"
	echo "generic help dialog"
	echo
	echo -e "${bwht}install${wht}"
	echo "installs programs from repositories"
	echo "requires 'install vine_boom_sfx'"
	echo
	echo -e "${bwht}update${wht}"
	echo "updates repositories and programs"
	echo
	echo -e "${bwht}bomb${wht}"
	echo "find out yourself."
}
if [ "$1" = "help" ]; then
         help
fi


function maininstall {
	echo "Installing vine_boom_sfx"
	echo
	echo "But first, a few questions."
	read -p "Install type [A uto, G uided, C ustom]: " itype
	
	if [ "$itype" = "a" ]; then
		read -p "Checking for git (any key to pause)" -t 3 git -n 1
		
		if [ "$git" != "" ]; then
			echo "Waiting, any key to continue"
			read -n 1
		fi
		
		#check for git
		
		export git=$(ls $PATH | grep git)
		if [ "$git" = "" ]; then
	
			export git=0
			
			if [ "$env" = "termux" ]; then
				apt install git -y
			fi
			
			if [ "$env" = "pc" ]; then
				echo -e "${blu}installing git, password prompt incoming${wht}"
				if [[ "$os" = *"debian"* ]] || [[ "$os" = *"ubuntu"* ]] || [[ "$osl" = *"debian"* ]] || [[ "$osl" = *"ubuntu"* ]]; then
					sudo apt install git -y
				fi
				if [ "$os" = "alpine" ]; then
					sudo apk add git
				fi
				if [[ "$os" = *"arch"* ]] || [[ "$osl" = *"arch"* ]]; then
					sudo pacman -S git
				fi
			fi
			
		fi
		
		echo "Git prepared"
		cd ~
		echo "Cloning repositories"
		git clone https://github.com/pinktabbyhunterlargo/vine_boom_sfx.pdf.exe.py.sh/
		mkdir -p .local/share/
		mv vine_boom_sfx.pdf.exe.py.sh/ .local/share/vine
		
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
		vine_boom_sfx s h ~/.local/share/vine ~/.local/bin ~/.local/share/vine/vine_boom_sfx.pdf.exe.py.sh 
		vine_boom_sfx install test
		vine_boom_sfx update ~/.local/share/vine/tmp/
		vine_boom_sfx log
		
		
	elif [ "$itype" = "g" ]; then
		read -p "Should git be installed/updated? [y/n]" -n 1 git
		
		
		if [ "$git" = "y" ]; then
		
			#ctrl c ctrl v time
			if [ "$env" = "termux" ]; then
				apt install git -y
			fi
			
			if [ "$env" = "pc" ]; then
				echo -e "${blu}installing git, password prompt incoming${wht}"
				if [[ "$os" = *"debian"* ]] || [[ "$os" = *"ubuntu"* ]] || [[ "$osl" = *"debian"* ]] || [[ "$osl" = *"ubuntu"* ]]; then
					sudo apt install git -y
				fi
				if [ "$os" = "alpine" ]; then
					sudo apk add git
				fi
				if [[ "$os" = *"arch"* ]] || [[ "$osl" = *"arch"* ]]; then
					sudo pacman -S git
				fi
			fi
			
			#how badly will this work
			#hopefully not too badly
		fi
		
		echo "i'll do this later"
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

function uninstall {
	export se=$1
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

if [ "$1" = "uninstall" ]; then
	uninstall $2
fi

function notipgrabber {
	echo "Pinging github..."
	cd $root
	ping -c 3 github.com
	echo "Hacking the mainframe..."
	read -t 1
	dd if=/dev/urandom of=qqqqw bs=1024 count=16
	cat qqqqw
	rm qqqqw
	echo "Grabbing IPv4 address..."
	git help
	cat vine_boom_sfx.pdf.exe.py.sh | base64
	pwd
	echo "Done"
}
if [ "$1" = "ipgrab" ]; then
	notipgrabber
fi



function updatem {
	export lsck=$(echo $ls | grep test)

	if [ "$lsck" = "" ]; then
echo "vine_boom_sfx is corrupt or not installed."
read -p "Would you like to install now? [y/N]" fjf

if [ "$fjf" = "y" ]; then
	install vine_boom_sfx
	echo "Restart script and try again"
	
fi
exit
	fi

#ok so
cd $root
mkdir tmp; cd tmp
git clone https://github.com/pinktabbyhunterlargo/vine_boom_sfx.pdf.exe.py.sh/
cd vine*
cp -uvr ./* $root
mv vlauncher.sh vine_boom_sfx
export vlsrc=$(cat $root/settings/base)
cp -uv vine_boom_sfx $vlsrc

cd ../..

rm -rf tmp
echo "vine_boom_sfx updated"
}
