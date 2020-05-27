#!/bin/bash
cd $HOME
git clone https://github.com/keiya/rc.git $HOME/repos/rc

ln -s $HOME/repos/rc/.gitconfig $HOME/

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# nvim
mkdir -p $HOME/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
ln -s $HOME/repos/rc/.zshrc $HOME/
zsh $HOME/repos/rc/setup-prezto.sh

ln -s $HOME/repos/rc/.tmux.conf $HOME/
ln -s $HOME/repos/rc/.toprc $HOME/
ln -s $HOME/repos/rc/.vimrc $HOME/
ln -s $HOME/repos/rc/.vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/repos/rc/.editorconfig $HOME/
mkdir -p $HOME/.ssh/
chmod 700 .ssh
touch $HOME/.ssh/ssh_config
ln -s $HOME/repos/rc/ssh_config $HOME/.ssh/config

vim +PlugInstall +qall
if [ -x "$(command -v nvim)" ]; then
  nvim +PlugInstall +qall
fi

# https://askubuntu.com/a/87066
# If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc
