#!/bin/bash

dir=`pwd`
foundsdir="$dir/dotfiles_found"
files="vimrc bash_profile"

mkdir -p $olddir
cd $dir
for file in $files; do
    mv ~/.$file $foundsdir
    ln -s $dir/$file ~/.$file
done
