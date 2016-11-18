#!/bin/zsh

() {
    local dir=`pwd`

    function link() {
        local file=$1
        [[ -e "$HOME/$file" ]] || ln -s "$dir/$file" "$HOME/$file"
    }

    link .vimrc
    link .gvimrc
    link .vim
    link .zshrc
    link .zsh.d
    link .gitconfig
    link .gitignore-global
}
