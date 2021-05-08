read -p "Install recomended software [Y/n] " -n 1 -r
echo    # (optional) move to a new line 
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo apt install cmake make vim tmux 
	mkdir repos
  pushd repos	
  git clone	https://github.com/powerline/fonts.git
	pushd fonts
	./install.sh
	popd
  git clone https://github.com/speedenator/agnoster-bash.git
	popd
fi

cp .bashrc ~
cp .tmux.conf ~
cp .vimrc ~

grep ~/.bashrc -e "source $(pwd)/scripts/$(hostname)_specific.sh" > /dev/null
if [ $? == 1 ] &&  [ -e scripts/$(hostname)_specific.sh ]
then
	echo "source $(pwd)/scripts/$(hostname)_specific.sh" >> ~/.bashrc
fi


