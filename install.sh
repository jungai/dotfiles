#!/usr/bin/env bash

set -euo pipefail

current_path="$(pwd)"
target_config_dir="$HOME/.config"

# .config

configs=(
	".config/ghostty"
	".config/starship.toml"
	".config/zellij"
	".config/wezterm"
	".config/sketchybar"
	".config/kitty"
	".config/borders"
	".config/nvim"
)

if [[ ! -d "$target_config_dir" ]]; then
	echo "== Create $target_config_dir =="
fi

echo "================"
echo "Prepare configs in .config"
echo "================"

for config in "${configs[@]}"; do

	if [[ -e "$current_path/$config" ]]; then
		ln -sf "$current_path/$config" "$target_config_dir"
		echo "|> $config to $target_config_dir ✅"
	else
		echo "💥 $config not found"
		exit 1
	fi
done

# home
configs=(
	".gitconfig"
)

echo "================"
echo "Prepare configs in $HOME"
echo "================"

for config in "${configs[@]}"; do

	if [[ -e "$current_path/$config" ]]; then
		ln -sf "$current_path/$config" "$HOME"
		echo "|> $config to $HOME$config ✅"
	else
		echo "💥 $config not found"
		exit 1
	fi
done