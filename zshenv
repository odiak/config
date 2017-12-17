### .zshenv

export LC_CTYPE="en_US.UTF-8"

export EDITOR="vim"

if ! type vim > /dev/null 2>&1; then
    alias vim="vi"
fi


grep_options=""
grep_options="--binary-files=without-match $grep_options"

if grep --help 2>&1 | grep -q -- --color; then
    grep_options="--color=auto $grep_options"
fi

alias grep="grep $grep_options"
