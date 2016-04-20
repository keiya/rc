#!/bin/bash
cd $HOME
git clone https://github.com/keiya/rc.git $HOME/repos/rc
git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
ln -s $HOME/repos/rc/.tmux.conf $HOME/
ln -s $HOME/repos/rc/.toprc $HOME/
ln -s $HOME/repos/rc/.vimrc $HOME/
vim +PluginInstall +qall
