#!/usr/bin/env bash

# Function to check if tmux is installed
check_tmux_installed() {
	if ! command -v tmux >/dev/null 2>&1; then
		echo "Error: tmux is not installed. Please install tmux first."
		exit 1
	fi
}

# Function to check if fzf is installed
check_fzf_installed() {
	if ! command -v fzf >/dev/null 2>&1; then
		echo "Error: fzf is not installed. Please install fzf first."
		exit 1
	fi
}

# Check if we're already in a tmux session
check_existing_session() {
	if [[ -n "$TMUX" ]]; then
		echo "Already in a tmux session"
		exit 0
	fi
}

# Main function to handle session selection and attachment
handle_session() {
	# Get list of sessions and use fzf for selection
	local session
	session="$(tmux ls 2>/dev/null | fzf --reverse --exit-0)"

	# Check if any sessions exist
	if [[ -z "$(tmux ls 2>/dev/null)" ]]; then
		echo "No tmux sessions found. Creating a new session..."
		tmux new-session
		exit 0
	fi

	# Handle session selection
	if [[ -n "$session" ]]; then
		# Extract session name (everything before ':')
		local target
		target=$(echo "$session" | cut -d: -f1)

		echo "Attaching to session: $target"
		tmux attach-session -t "$target"
	else
		echo "No session selected"
		exit 0
	fi
}

# Main script execution
main() {
	check_tmux_installed
	check_fzf_installed
	check_existing_session
	handle_session
}

main
