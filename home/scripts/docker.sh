#!/usr/bin/env bash

# Function to check if required commands exist
check_dependencies() {
	local deps=("docker" "fzf" "awk")
	for cmd in "${deps[@]}"; do
		if ! command -v "$cmd" &>/dev/null; then
			echo "Error: $cmd is not installed. Please install it first."
			exit 1
		fi
	done
}

# Function to select and remove container
remove_container() {
	# Get container ID using fzf
	local container_id
	container_id=$(docker ps | fzf --reverse | awk '{print $1}')

	# Check if a container was selected
	if [[ -z "$container_id" ]]; then
		echo "No container selected"
		exit 0
	fi

	# Stop and remove the container
	if docker stop "$container_id" && docker rm "$container_id"; then
		echo "✅ Successfully stopped and removed container $container_id"
	else
		echo "❌ Failed to stop or remove container $container_id"
		exit 1
	fi
}

# Main execution
main() {
	check_dependencies
	remove_container
}

main
