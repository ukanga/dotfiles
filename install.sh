#!/bin/bash

BASEDIR=$(dirname $(realpath $0))
TIMESTAMP=`date '+%Y.%m.%d-%H:%M:%S'`

function xresources_install {
    # backup
    mv ~/.Xresources ~/.Xresources.$TIMESTAMP.bak

    # download base16-xresources
    git clone https://github.com/chriskempson/base16-xresources.git ~/.config/base16-xresources || (cd ~/.config/base16-xresources && git pull && cd -)

    # install .Xresources
    ln $BASEDIR/Xresources ~/.Xresources
}

function i3_install {
    # backup
    mv ~/.config/i3 ~/.config/i3.$TIMESTAMP.bak
    
    # base16-i3
    git clone https://github.com/chriskempson/base16-i3.git ~/.config/base16-i3 || (cd ~/.config/base16-i3 && git pull && cd -)

    # install
    ln -s $BASEDIR/config/i3 ~/.config/
}

function neovim_install {
    # backup
    mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.$TIMESTAMP.bak
    mv ~/.vimrc ~/.vimrc.$TIMESTAMP.bak
    mv ~/.vim ~/.vim.$TIMESTAMP.bak
    
    # installi vim-plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # install
    mkdir -p ~/.config/nvim
    ln -s $BASEDIR/config/nvim/init.vim ~/.config/nvim/init.vim
    ln -s $BASEDIR/config/nvim/init.vim ~/.vimrc
    ln -s ~/.config/nvim ~/.vim

    nvim +PlugInstall
}

function tmux_install {
    # backup
    mv ~/.tmux.conf ~/.tmux.conf.$TIMESTAMP.bak
    
    # install
    ln -s $BASEDIR/tmux.conf ~/.tmux.conf
}

function neofetch_install {
    # backup
    mv ~/.config/neofetch ~/.config/neofetch.$TIMESTAMP.bak
    
    # install
    ln -s $BASEDIR/config/neofetch ~/.config/
}

function base16_shell_install {
    # base16-shell
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || (cd ~/.config/base16-shell && git pull && cd -)
}

if [ $1 = 'shell' ]; then
    base16_shell_install
fi
if [ $1 = 'neofetch' ]; then
    neofetch_install
fi
if [ $1 = 'neovim' ]; then
    neovim_install
fi
if [ $1 = 'tmux' ]; then
    tmux_install
fi
if [ $1 = 'i3' ]; then
    i3_install
fi
if [ $1 = 'xresources' ]; then
    xresources_install
fi
