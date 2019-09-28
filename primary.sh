#!/bin/sh

tmux new-session -A -s primary -d -c ~/dev/primary

tmux select-window -t 0
tmux rename-window web-dev
tmux send-keys "sudo docker-compose start web-dev && sudo docker-compose start dev-db && sudo docker-compose start redis" C-m

tmux new-window -c ~/dev/primary
tmux select-window -t 1
tmux rename-window web-dev-logs
tmux send-keys "sudo docker-compose logs --follow web-dev" C-m

tmux new-window -c ~/dev/primary
tmux select-window -t 2
tmux rename-window bash
tmux send-keys "git branch; git status" C-m

tmux new-window -c ~/dev/primary
tmux select-window -t 3
tmux rename-window vim
tmux send-keys "vim" C-m

tmux attach-session -t primary
