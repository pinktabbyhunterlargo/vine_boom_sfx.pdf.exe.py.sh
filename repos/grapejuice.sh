# find environment
colour="\e[1;34m"
reset="\e[0m"
export un=$(uname -o)
if [ "$un" = "Android" ]; then
	echo -e "${colour}not supported${reset}"
fi
sudo apt install -y python3-pip python3-setuptools python3-wheel python3-dev pkg-config libcairo2-dev gtk-update-icon-cache desktop-file-utils xdg-utils libgirepository1.0-dev gir1.2-gtk-3.0
git clone https://gitlab.com/brinkervii/grapejuice.git ~/.vine/tmp/grapejuice
python3 ~/.vine/tmp/grapejuice/install.py
