#!/bin/bash
cd $HOME
git clone https://github.com/keiya/rc.git $HOME/repos/rc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $HOME/repos/rc/.tmux.conf $HOME/
ln -s $HOME/repos/rc/.toprc $HOME/
ln -s $HOME/repos/rc/.vimrc $HOME/
mkdir -p $HOME/.ssh/
chmod 700 .ssh
touch $HOME/.ssh/ssh_config
ln -s $HOME/repos/rc/ssh_config $HOME/.ssh/config
vim +PlugInstall
