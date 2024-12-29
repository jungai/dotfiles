#!/usr/bin/env bash

session="$(tmux ls | fzf --reverse)"

if [[ "$TERM_PROGRAM" = "tmux" ]]; then
	echo "Already in a tmux session"

else
	if [[ "$session" ]]; then
		target="${session:0:1}"
		tmux attach-session -t $target
	else
		echo "No session selected"
		return 0
	fi
fi
