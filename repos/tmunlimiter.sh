c="\e[1;34m"
n="\e[0;37m"
echo "${c}Making temp directory (~/.local/share/vine/Unlimiter)"

cd ~/.local/share/vine
mkdir Unlimiter
cd Unlimiter

echo "Downloading files${n}"

mkdir main && cd main
wget https://unlimiter.net/download
unzip download
cd ..
wget https://www.dropbox.com/s/bqocq0lonw5lw9j/TmForever.exe?dl=1
mv TmForever.exe?dl=1 TmForever.exe

echo "${c}Installing"
echo "Nations or United (1/2 or n/u)"
read -n 1 game

if [ "$game" = "u" ]
then
	export game=2
fi
if [ "$game" = "n" ]
then
	export game=1
fi

#actually installing now
if [ "$game" = "2" ]
then
	cd "~/.steam/steam/steamapps/common/TrackMania United"
else
	cd "~/.steam/steam/steamapps/common/TrackMania Nations Forever"
fi
cp ~/.local/share/vine/Unlimiter/main/Main\ Content/* ./
echo "Keep original TmForever? (y/n)"
read -n 1 keep

if [ "$keep" = "y" ]
then
	echo "Copying to ~"
	cp TmForever.exe ~
fi
cp ~/.local/share/vine/Unlimiter/TmForever.exe ./

if [ "$game" = "2" ]
then
	cd "~/.steam/steam/steamapps/compatdata/7200/pfx/drive_c/users/steamuser/My Documents/TrackMania/"
	cp ~/Unlimiter/main/Additional\ Content/* ./
else
	cd "~/.steam/steam/steamapps/compatdata/11020/pfx/drive_c/users/steamuser/My Documents/TrackMania/"
	cp ~/Unlimiter/main/Additional\ Content/* ./
fi
echo "Installation complete.${n}"
