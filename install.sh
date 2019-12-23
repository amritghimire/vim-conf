#!/bin/bash

echo This script can remove your existing vim configuration if any
read -r -p "Do you wish to continue? [y/N]:" response
case "$response" in
	[yY][eE][sS]|[yY])
		git --version 2>&1 >/dev/null
		GIT_IS_AVAILABLE=$?
		if [ $GIT_IS_AVAILABLE -eq 0 ];
		then
			echo git is availiable.
			curl --version 2>&1 >/dev/null
			CURL_IS_AVAILABLE=$?
			if [ $CURL_IS_AVAILABLE -eq 0 ];
			then
			echo curl is availiable.
			DIRECTORY=$HOME/.vim/autoload/plug.vim
			if [ -d "$DIRECTORY" ]; then
				rm -rf $DIRECTORY
			fi
			DIRECTORY=$HOME/.vim
			if [ -d "$DIRECTORY" ]; then
				mkdir $DIRECTORY
			fi
			curl -sS https://raw.githubusercontent.com/dpakach/vim-conf/master/.vimrc > $HOME/.vimrc && \
			curl -sS https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > $HOME/.vim/autoload/plug.vim && \
			vim +PlugInstall +qall
			else
			echo curl is not installed.Please Install git in your system and continue.
			fi
		else
			echo git is not installed.Please Install git in your system and continue.
		fi
		;;
	*)
		exit 0
		;;
esac
EXIT=1
while [ $EXIT -ne 0 ]; do
	echo "Do you want to clone this repository?"
	read -r -p "If yes give the path, otherwise press enter" path
	echo $path
	if [ -z "$path" ]; then
		echo "No path given. Closing"
		exit 0
	fi
	git clone https://github.com/dpakach/vim-conf "$path/vim-conf" || true
	if [ -d "$path" ]; then
		exit 0
	fi
done
