echo "Making temp directory (~/Unlimiter)"

cd ~
mkdir Unlimiter
cd Unlimiter

echo "Downloading files"

mkdir main && cd main
wget https://unlimiter.net/download
unzip download
cd ..
wget https://www.dropbox.com/s/bqocq0lonw5lw9j/TmForever.exe?dl=1
mv TmForever.exe?dl=1 TmForever.exe

echo "Installing"
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
cp ~/Unlimiter/main/Main\ Content/* ./
echo "Keep original TmForever? (y/n)"
read -n 1 keep

if [ "$keep" = "y" ]
then
	echo "Copying to ~"
	cp TmForever.exe ~
fi
cp ~/Unlimiter/TmForever.exe ./

if [ "$game" = "2" ]
then
	cd "~/.steam/steam/steamapps/compatdata/7200/pfx/drive_c/users/steamuser/My Documents/TrackMania/"
	cp ~/Unlimiter/main/Additional\ Content/* ./
else
	cd "~/.steam/steam/steamapps/compatdata/11020/pfx/drive_c/users/steamuser/My Documents/TrackMania/"
	cp ~/Unlimiter/main/Additional\ Content/* ./
fi

echo "Removing temp files"
rm -rf ~/Unlimiter
echo "Installation complete."
