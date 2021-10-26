# find environment
colour="\e[1;34m"
reset="\e[0m"
export os=$(awk -F= '$1=="ID_LIKE" { print $2 ;}' /etc/os-release)
export osalt=$(awk -F= '$1=="ID" { print $2 ;}' /etc/os-release)
export un=$(uname -o)
if [ "$un" = "Android" ]; then
	echo -e "${colour}not supported${reset}"
fi

#dependencies
echo -e "${colour}installing dependencies, password prompt incoming${reset}"
if [[ "$os" = *"ubuntu"* ]] || [[ "$osalt" = *"ubuntu"* ]] || [[ "$os" = *"debian"* ]] || [[ "$osalt" = *"debian"* ]]; then
	sudo apt install -y python3-pip python3-setuptools python3-wheel python3-dev pkg-config libcairo2-dev gtk-update-icon-cache desktop-file-utils xdg-utils libgirepository1.0-dev gir1.2-gtk-3.0
	echo -e "${colour}experimental wine installer(debian 11 and higher, maybe ubuntu), could possibly break things${reset}"
	read -r -p "install wine? [y/N]" response
	response=${response,,}
	if [[ "$response" =~ ^(yes|y)$ ]];then
		sudo echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" > /etc/apt/sources.list.d/wine.list
		sudo dpkg --add-architecture i386
		wget -nc https://dl.winehq.org/wine-builds/winehq.key
		sudo apt-key add winehq.key
		sudo apt install --install-recommends winehq-devel
	fi
elif [[ "$os" = *"arch"* ]] || [[ "$osalt" = *"arch"* ]]; then
	sudo pacman -S wine git python-pip cairo gtk3 gobject-introspection desktop-file-utils xdg-utils xdg-user-dirs gtk-update-icon-cache shared-mime-info lib32-gnutls lib32-openssl lib32-pipewire lib32-libpulse lib32-alsa-lib lib32-alsa-plugins
elif [[ "$osalt" = *"solus"* ]]; then
	sudo eopkg it -c system.devel
	sudo eopkg install wine wine-32bit git python3-devel libcairo-devel
elif [[ "$os" = *"rhel"* ]] || [[ "$osalt" = *"fedora"* ]]; then
	sudo dnf install git python3-devel python3-pip cairo-devel gobject-introspection-devel cairo-gobject-devel dbus-glib-devel make wine xdg-utils
fi

#actually installing now
echo -e "${colour}installing grapejuice...${reset}"
git clone https://gitlab.com/brinkervii/grapejuice.git ~/.local/share/vine/tmp/grapejuice
python3 ~/.vine/tmp/grapejuice/install.py
