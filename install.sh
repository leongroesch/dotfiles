read -p "Install recomended software [Y/n] " -n 1 -r
echo    # (optional) move to a new line 
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt install cmake make vim tmux dconf-cli bat
fi

#import gnome terminal profile
read -p "Load gnome-erminal profiles (Only Hostcomputer) [Y/n] " -n 1 -r
echo    # (optional) move to a new line 
if [[ $REPLY =~ ^[Yy]$ ]]
then
	dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
fi

cp .bashrc ~
cp .tmux.conf ~
cp .vimrc ~

grep ~/.bashrc -e "source $(pwd)/scripts/$(hostname)_specific.sh" > /dev/null
if [ $? == 1 ] &&  [ -e scripts/$(hostname)_specific.sh ]
then
	echo "source $(pwd)/scripts/$(hostname)_specific.sh" >> ~/.bashrc
fi

source ~/.bashrc

