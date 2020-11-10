#!/bin/bash
git clone --recursive https://github.com/reverie0829/My_vimrc.git
cd My_vimrc
cp vimrc ~/.vimrc
mv vim ~/.vim
apt install curl ctags -y
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd ..
rm -r My_vimrc
