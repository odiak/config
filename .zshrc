[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/profile ] && source ~/profile

autoload -U compinit
compinit
autoload -U colors
colors
autoload -U promptinit
promptinit
autoload -U zed

export LANG=en_US.UTF-8

case "${TERM}" in
kterm*|xterm)
	precmd(){
		#echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
		echo -ne "\033]0;${USER}@${HOST}:${PWD}\007"
	}
esac


case "${OSTYPE}" in
darwin*)
    alias ls='ls -G -w'
    ;;
linux*)
    alias ls='ls --color'
    ;;
esac

alias zshrc='source ~/.zshrc'
alias vi='vim'
alias ll='ls -l'
alias l.='ls -d .*'
alias ll.='ls -l -d .*'

setopt auto_cd
setopt auto_pushd
setopt correct

PROMPT="%{${fg[blue]}%}[%n@%M]%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

function mkcd () {
    if [ -n "$1" ]; then
        if [ -f $1 ]; then
            echo "'$1' is already exist! (normal file)"
        else
            if [ ! -d $1 ]; then
                mkdir $1
            fi
            cd $1
        fi
    else
        echo 'mkcd [dirname]'
    fi
}
