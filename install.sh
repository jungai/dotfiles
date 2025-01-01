#!/usr/bin/env bash

set -euo pipefail

current_path="$(pwd)"
config_dir="$HOME/.config"

if [[ ! -d "$config_dir " ]]; then
	echo "== Create $config_dir =="
fi

create_symlink() {
	local src="$1"
	local dst_dir="$2"
	local base_name

	# If a third argument is provided, use that as the symlink name;
	# otherwise, use the basename of src
	if [[ $# -eq 3 ]]; then
		base_name="$3"
	else
		base_name="$(basename "$src")"
	fi

	if [[ -e "$src" ]]; then
		# Create destination directory if it doesn't exist
		mkdir -p "$dst_dir"

		ln -sf "$src" "$dst_dir"
		echo "|>  $src → $dst_dir/$base_name ✅"
	else
		echo "💥 $src not found" >&2
		exit 1
	fi
}

# .config
configs_in_config_dir=(
	"ghostty"
	"starship.toml"
	"zellij"
	"wezterm"
	"sketchybar"
	"kitty"
	"borders"
	"nvim"
)

echo ""
echo "================"
echo "Prepare configs in $config_dir"
echo "================"

for config_item in "${configs_in_config_dir[@]}"; do
	local_src="$current_path/.config/$config_item"
	create_symlink "$local_src" "$config_dir"
done

# home
configs_in_home=(
	".gitconfig"
)

echo ""
echo "================"
echo "Prepare configs in $HOME"
echo "================"

for config_item in "${configs_in_home[@]}"; do
	local_src="$current_path/$config_item"
	create_symlink "$local_src" "$HOME"
done

echo ""
echo "🚀All symlinks successfully created!"
