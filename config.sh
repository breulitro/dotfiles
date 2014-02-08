#!/bin/bash

dir=`pwd`
foundsdir="$dir/dotfiles_found"
files="vimrc bash_profile aliases"

cd $dir
for file in $files; do
	if [ -h ~/.$file ]; then
		unlink ~/.$file
	elif [ -f ~/.$file ]; then
		if [ -d $foundsdir ]; then
			mkdir $foundsdir
		fi
	    mv ~/.$file $foundsdir
	fi


    ln -s $dir/$file ~/.$file
done
