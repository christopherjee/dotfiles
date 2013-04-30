alias ll='ls -la'
alias datets='date +%s'
tailf () { tail -f $1; }
tailfs() { tail -f $1 | fgrep "$2"; }
alias git-root='cd $(git rev-parse --show-toplevel)'
alias vimbranch='vim $(git diff master.. --name-only --relative)'
alias vimdiff='vim $(git diff --name-only --relative)'

alias tmp_clear='sudo rm -rf $PROJECT_ROOT/tmp/templates/compile'

if [ "$TERM" != 'dumb' ] && [ -n "$BASH" ] && [ -n "$PS1" ]
then
        if [ `/usr/bin/whoami` = 'root' ]
        then
                export PS1='\[\033[01;31m\]\h \[\033[01;34m\]\W \$ \[\033[00m\]'
        else
                export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\W \$ \[\033[00m\]'
        fi
fi

source ~/.bashrc_custom
source ~/dotfiles/bash_gitprompt
source ~/dotfiles/bash_gitcompletion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
