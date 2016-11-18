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

# typeset -U path PATH


# zsh-notify
[ -f "$HOME/.zsh.d/zsh-notify/notify.plugin.zsh" ] \
    && source "$HOME/.zsh.d/zsh-notify/notify.plugin.zsh"

zstyle ':notify:*' command-complete-timeout 15

# bew_update_suggester
[ -f "$HOME/config/brew_update_suggester.rb" ] \
    && ruby "$HOME/config/brew_update_suggester.rb"


case "${TERM}" in
kterm*|xterm)
    precmd(){
        #echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
        echo -ne "\033]0;${USER}@${HOST}:${PWD}\007"
    }
esac


# z
[ -f "$HOME/.zsh.d/z/z.sh" ] \
    && source "$HOME/.zsh.d/z/z.sh"


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
alias ipy='ipython --no-confirm-exit'
alias be='bundle exec'
alias serve='python -mSimpleHTTPServer'
alias s='serve >/dev/null 2>&1 &'
alias twy='tw --yes'
alias twp='cat | tw --pipe'
which geeknote > /dev/null 2>&1 && \
    alias gn='geeknote'
alias g='git'
alias pad='padrino'

alias chrome-memory="echo $(($(ps aux|grep Chrome|awk '{s+=$6}END{print s}')/1e6))"

setopt auto_cd
setopt auto_pushd
setopt correct

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

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

which rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"

export PATH="./vendor/bin:$PATH"
