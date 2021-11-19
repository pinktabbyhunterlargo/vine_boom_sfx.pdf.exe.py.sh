#!/bin/bash

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

function help {

	echo -e "${bwht}vine_boom_sfx.pdf.exe.py.sh${wht}"
	echo
	echo -e "to get started, install vine_boom_sfx by doing ${blu}./vine_boom_sfx.pdf.exe.py.sh install vine_boom_sfx${wht}"
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
	echo -e "${bwht}e05${wht}"
	echo "e05 momen"
	echo 
	echo -e "${bwht}bomb${wht}"
	echo "find out yourself."
}

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
		#git is done
		
		echo "Git prepared"
		cd ~
		echo "Cloning repositories"
		git clone https://github.com/pinktabbyhunterlargo/vine_boom_sfx.pdf.exe.py.sh.git vine_boom_sfx
		echo "Installing"
		
		mkdir -p .local/share
		mkdir -p .local/bin
		#make sure
		
		mv vine_boom_sfx .local/share/vine_boom_sfx
		export $root=~/.local/share/vine_boom_sfx
		cp $root/files/vlauncher.sh .local/bin/vine_boom_sfx
		chmod +x .local/bin/vine_boom_sfx $root/vine_boom_sfx.pdf.exe.py.sh
		mkdir $root/tmp
		
		vine_boom_sfx s h $root ~/.local/bin $root/vine_boom_sfx.pdf.exe.py.sh
		vine_boom_sfx -x
		if [ "$(vine_boom_sfx -x)" = "ping" ]; then
			echo "success"
		else
			echo "something went wrong"
		fi
		
		

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
		read -p "Installation place: " loc
		cd $loc
		echo "$(pwd)"
		read -t 1
		git clone https://github.com/pinktabbyhunterlargo/vine_boom_sfx.pdf.exe.py.sh.git
		read -p "Directory name: " name
		mv vine_boom_sfx.pdf.exe.py.sh $name
		read -p "Choose \$PATH [/bin, ~/.local/bin, ...]: " bin
		cp files/vlauncher.sh $bin/vine_boom_sfx
		chmod +x *
		chmod +x $bin/vine_boom_sfx
		vine_boom_sfx s h $loc/$name $bin $loc/$name/vine_boom_sfx.pdf.exe.py.sh 	
		export vbsd=$(vine_boom_sfx -x)
		if [ "$vbsd" = "ping" ]; then
			echo "vlauncher installed"
		else
			echo "vlauncher failed"
		fi
	fi
}

function bomb {
	f
	a
	adfds[sa[s[f[[[f[as]]]]]]
	sdfs[[[f[s[fs]d]s]ds]]d]
}

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
	chmod +x $se.vine
	./$se.vine
	echo "$se" >> ../settings/pkglist
	fi

}

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
	./$se.vine
}

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

function mainupdate {
	export lsck=$(echo $ls | grep test)

	if [ "$lsck" = "" ]; then
echo "vine_boom_sfx is corrupt or not installed."
read -p "Would you like to install now? $blu[y/N]$wht" fjf

if [ "$fjf" = "y" ]; then
	install vine_boom_sfx
	echo "Restart script and try again"
	
fi

echo "å"
exit
	fi

#ok so
cd $root
mkdir tmp; cd tmp
git clone https://github.com/pinktabbyhunterlargo/vine_boom_sfx.pdf.exe.py.sh.git
cd vine_boom_sfx*
cp -uvr ./* $root
mv files/vlauncher.sh vine_boom_sfx
export vlsrc=$(cat $root/settings/base)
cp -uv vine_boom_sfx $vlsrc

cd ../..

rm -rf tmp
echo "vine_boom_sfx updated"
}

function pkgupdate {
	echo "'ö'"
}

function e05 {
	ytdlp="cat ~/.local/share/vine/settings/pkglist | grep yt-dlp"
	strak="ls ~/.local/vine/files/ | grep e05"
	if [ "$strak" = "" ]; then
		if [ "$ytdlp" = "" ]; then
			echo -e "${bblu}installing yt-dlp${wht}"
			sh ~/.local/bin/vine_boom_sfx install yt-dlp
		fi
		yt-dlp -o ~/.local/vine/files/e05.opus --extract-audio "https://youtu.be/A44IL09bxd8"
	fi
	ffplay -autoexit -volume 60 -nodisp ~/.local/vine/files/e05.opus
}

function hnew {
	echo -e "$blu Notes on the latest update: \n
	$wht help new was added, use it for new update info \n 
	v1 is starting development. Support will continue. \n
	Use the old package manager with install -l package \n
	
	"

function bpmanage {

	#so you know the first package manager?
	#this is better package manager

	export total=$#
	if (( "$(echo $@ | grep -c "-l")" > 0 )); then
		$1 $3
	else
		files/bpm.py $@
	
	fi

# ½
}

function upgrade {
	cd $root
	cd files
	./upgrade.sh $@
}

#the actual execution of the functions
#put new functions before these comments

if [ "$1" = "help" ]; then
		if [ "$2" = "new" ]; then
			hnew
		else
			help
		fi
elif [ "$1" = "bomb" ]; then
	bomb
elif [ "$1" = "update" ];then
	mainupdate && pkgupdate $2
elif [ "$1" = "install" ]; then
   bpmanage $@
elif [ "$1" = "search" ]; then
	search $@
elif [ "$1" = "uninstall" ]; then
	bpmanage $@
elif [ "$1" = "ipgrab" ]; then
	notipgrabber
elif [ "$1" = "e05" ]; then
	e05
elif [ "$1" = "upgrade" ]; then
	export version=1.0.0
	upgrade $root $version
fi
