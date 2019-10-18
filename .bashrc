export export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
alias datets='date +%s'
tailf () { tail -f $1; }
tailfs() { tail -f $1 | fgrep "$2"; }
alias git-root='cd $(git rev-parse --show-toplevel)'
alias vimbranch='vim $(git diff master.. --name-only --relative)'
alias vimdiff='vim $(git diff --name-only --relative)'
bind '"\t":menu-complete'

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

export PATH="~/dotfiles:$PATH:/sbin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(docker-machine env default)"
alias primary-dev='open "http://$(docker-machine ip):3000"'
