cp .bashrc ~
cp .tmux.conf ~
cp .vimrc ~

grep ~/.bashrc -e "source $(pwd)/scripts/$(hostname)_specific.sh" > /dev/null
if [ $? == 1 ] &&  [ -e scripts/$(hostname)_specific.sh ]
then
	echo "source $(pwd)/scripts/$(hostname)_specific.sh" >> ~/.bashrc
fi


