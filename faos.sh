#!/bin/sh

if ! tmux attach-session -t faos
then
    tmux new-session -A -s faos -d -c ~/dev/faos-v0

    tmux select-window -t 0
    tmux rename-window slate
    tmux send-keys "slate start" C-m

    tmux new-window -c ~/dev/faos-v0
    tmux select-window -t 1
    tmux rename-window bash
    tmux send-keys "git branch; git status" C-m

    tmux new-window -c ~/dev/faos-v0
    tmux select-window -t 2
    tmux rename-window vim
    tmux send-keys "vim" C-m

    tmux attach-session -t faos
fi
