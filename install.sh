#!/usr/bin/env bash

set -euo pipefail

current_path="$(pwd)"
target_config_dir="$HOME/.config"

configs=(
	".config/ghostty"
	".config/starship.toml"
	".config/zellij"
	".config/wezterm"
	".config/sketchybar"
	".config/kitty"
)

if [[ ! -d "$target_config_dir" ]]; then
	echo "== Create $target_config_dir =="
fi

echo "Prepare config in .config"

for config in "${configs[@]}"; do

	if [[ -e "$current_path/$config" ]]; then
		echo "SymLink $config to $target_config_dir"
		ln -sf "$current_path/$config" "$target_config_dir"
	else
		echo "Error: $config not found"
		exit 1
	fi
done
