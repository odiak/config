#!/bin/zsh

() {
    local dir=$(cd $(dirname $0); pwd)

    echo "source $dir/zshrc" >> $HOME/.zshrc
    echo "source $dir/zshenv" >> $HOME/.zshenv
    echo "source $dir/vimrc" >> $HOME/.vimrc
    echo "set runtimepath+=$dir/vim" >> $HOME/.vimrc
    echo "source $dir/gvimrc" >> $HOME/.gvimrc
    git config --global include.path $dir/gitconfig
}
