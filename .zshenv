### .zshenv


export EDITOR="vim"

if ! type vim > /dev/null 2>&1; then
    alias vim="vi"
fi


export GREP_OPTIONS

GREP_OPTIONS="--binary-files=without-match $GREP_OPTIONS"

if grep --help 2>&1 | grep -q -- --color; then
    GREP_OPTIONS="--color=auto $GREP_OPTIONS"
fi
