## .zshrc


bindkey -e

if type brew &>/dev/null && [ -d "$(brew --prefix)/share/zsh-completions" ]; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi
autoload -U compinit
compinit
autoload -U colors
colors
autoload -U promptinit
promptinit
# autoload -U zed
autoload -U zmv

export LANG=en_US.UTF-8

# typeset -U path PATH

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
alias g='git'
alias ghq-peco="ghq list --full-path | peco"

alias chrome-memory="echo $(($(ps aux|grep Chrome|awk '{s+=$6}END{print s}')/1e6))"

setopt auto_cd
setopt auto_pushd
setopt correct
setopt histignorespace

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

PROMPT="%{${fg[blue]}%}[%n@%M] %~"$'\n'"%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
#setopt share_history        # share command history data

function mkcd () {
    mkdir $1 && cd $1
}

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

function cd-ghq-peco () {
    local repo=$(ghq list --full-path | peco)
    if [ -n "$repo" ]; then
        cd "$repo"
    fi
}

function code-ghq-peco () {
    local repo=$(ghq list --full-path | peco)
    if [ -n "$repo" ]; then
        code "$repo"
    fi
}

# Claude Desktop の Claude Code で、カレントディレクトリ（または引数のディレクトリ）を開く
ccd() {
  local dir=${1:-$PWD}
  dir=${dir:a}  # 絶対パス化

  if [[ ! -d $dir ]]; then
    print -u2 "ccd: not a directory: $dir"
    return 1
  fi

  # パスをURLエンコード（マルチバイト文字はバイト単位で %XX に）
  local LC_ALL=C enc= c i
  for (( i = 1; i <= ${#dir}; i++ )); do
    c=${dir[i]}
    if [[ $c == [A-Za-z0-9._~-] ]]; then
      enc+=$c
    else
      enc+=$(printf '%%%02X' "'$c")
    fi
  done

  open "claude://code/new?folder=${enc}"
}
