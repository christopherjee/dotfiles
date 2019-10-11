#!/bin/sh

tmux new-session -A -s faos -d -c ~/dev/faos

tmux select-window -t 0
tmux rename-window yarn
tmux send-keys "yarn start" C-m

tmux new-window -c ~/dev/faos
tmux select-window -t 1
tmux rename-window bash
tmux send-keys "git branch; git status" C-m

tmux new-window -c ~/dev/faos
tmux select-window -t 2
tmux rename-window vim
tmux send-keys "vim" C-m

tmux attach-session -t faos
