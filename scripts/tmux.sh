#!/usr/bin/env bash

session="$(tmux ls | fzf --reverse)"

if [[ "$session" ]]; then
	target="${session:0:1}"
	tmux attach-session -t $target
else
	echo "No session selected"
	return 0
fi
