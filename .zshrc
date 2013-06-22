## .zshrc


bindkey -e

autoload -U compinit
compinit
autoload -U colors
colors
autoload -U promptinit
promptinit
autoload -U zed
autoload -U zmv

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
    alias ls='ls -AGF'
    ;;
linux*)
    alias ls='ls -AF --color'
    ;;
esac

alias zshrc='source ~/.zshrc'
alias vi='vim'
alias ll='ls -lh'
alias l.='ls -d .*'
alias ll.='ls -lh -d .*'
alias ipy='ipython'
alias be='bundle exec'
alias serve='python -mSimpleHTTPServer'

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
#setopt share_history        # share command history data

function mkcd () {
    mkdir $1 && cd $1
}

