#!/usr/bin/env zx

try {
	const sessions = await $`tmux ls | fzf --reverse`;
	const session = sessions.stdout.trim().split(":")[0];
	await $`tmux attach-session -t ${session}`;
} catch (_error) {}