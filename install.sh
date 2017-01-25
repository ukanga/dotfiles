#!/bin/bash

TIMESTAMP=`date '+%Y.%m.%d-%H:%M:%S'`

# backup existing config
mv ~/.config/i3 ~/.config/i3.$TIMESTAMP.bak
mv ~/.config/neofetch ~/.config/neofetch.$TIMESTAMP.bak
mv ~/.Xresources ~/.Xresources.$TIMESTAMP.bak
mv ~/.tmux.conf ~/.tmux.conf.$TIMESTAMP.bak
mv ~/.config/neovim/ ~/.config/nvim/init.vim.$TIMESTAMP.bak
mv ~/.vimrc ~/.vimrc.$TIMESTAMP.bak


BASEDIR=$(dirname $(realpath $0))

git clone https://github.com/chriskempson/base16-xresources.git ~/.config/base16-xresources || (cd ~/.config/base16-xresources && git pull && cd -)
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || (cd ~/.config/base16-shell && git pull && cd -)
git clone https://github.com/chriskempson/base16-i3.git ~/.config/base16-i3 || (cd ~/.config/base16-i3 && git pull && cd -)

ln -s $BASEDIR/config/i3 ~/.config/
ln -s $BASEDIR/config/neofetch ~/.config/
ln $BASEDIR/Xresources ~/.Xresources
ln $BASEDIR/tmux.conf ~/.tmux.conf

# neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
ln $BASEDIR/config/nvim/init.vim ~/.config/nvim/init.vim
ln $BASEDIR/config/nvim/init.vim ~/.vimrc

nvim +PlugInstall
