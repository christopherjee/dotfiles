#!/bin/sh

if ! tmux attach-session -t primary
then
    tmux new-session -A -s primary -d -c ~/dev/primary

    tmux select-window -t 0
    tmux rename-window web-dev
    tmux send-keys "docker-compose start web-dev && docker-compose start dev-db && docker-compose start redis" C-m

    tmux new-window -c ~/dev/primary
    tmux select-window -t 1
    tmux rename-window web-dev-logs
    tmux send-keys "docker-compose logs --follow web-dev" C-m

    tmux new-window -c ~/dev/primary
    tmux select-window -t 2
    tmux rename-window git
    tmux send-keys "git branch; git status" C-m

    tmux new-window -c ~/dev/primary
    tmux select-window -t 3
    tmux rename-window primary-vim
    tmux send-keys "vim" C-m

    tmux new-window -c ~/dev/primary/vendor
    tmux select-window -t 4
    tmux rename-window vendor-vim
    tmux send-keys "vim" C-m

    tmux new-window -c ~/dev/primary
    tmux select-window -t 5
    tmux rename-window logs
    tmux send-keys "docker-compose logs --follow web-dev | grep -iE '(warn|error|zomg)'" C-m

    tmux new-window -c ~/dev/primary
    tmux select-window -t 6
    tmux rename-window pry
    tmux send-keys "docker-compose exec web-dev bundle exec rails c" C-m

    tmux new-window -c ~/dotfiles
    tmux select-window -t 7
    tmux rename-window dotfiles
    tmux send-keys "git branch; git status" C-m

    tmux attach-session -t primary
fi
