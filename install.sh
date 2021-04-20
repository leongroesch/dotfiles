read -p "Install recomended software [Y/n] " -n 1 -r
echo    # (optional) move to a new line 
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt install cmake make vim tmux
fi

cp .bashrc ~
cp .tmux.conf ~
cp .vimrc ~

grep ~/.bashrc -e "source $(pwd)/scripts/$(hostname)_specific.sh" > /dev/null
if [ $? == 1 ] &&  [ -e scripts/$(hostname)_specific.sh ]
then
	echo "source $(pwd)/scripts/$(hostname)_specific.sh" >> ~/.bashrc
fi


