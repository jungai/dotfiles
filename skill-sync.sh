#!/usr/bin/env bash

set -euo pipefail

submodule_path="home/skills"
commit_changes=0
push_changes=0

usage() {
	cat <<'USAGE'
Usage: ./skill-sync.sh [--commit] [--push]

Update the skills git submodule to its upstream branch and leave the parent
repository with the updated submodule pointer.

Options:
  --commit   Commit the updated submodule pointer in this dotfiles repo
  --push     Push the commit after --commit
  -h, --help Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
	case "$1" in
		--commit)
			commit_changes=1
			;;
		--push)
			commit_changes=1
			push_changes=1
			;;
		-h|--help)
			usage
			exit 0
			;;
		*)
			echo "Unknown option: $1" >&2
			usage >&2
			exit 1
			;;
	esac
	shift
done

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

if ! git config --file .gitmodules --get "submodule.$submodule_path.path" >/dev/null; then
	echo "Submodule not found in .gitmodules: $submodule_path" >&2
	exit 1
fi

if ! git -C "$submodule_path" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
	echo "==> Initializing submodule: $submodule_path"
	git submodule update --init -- "$submodule_path"
fi

if [[ -n "$(git -C "$submodule_path" status --porcelain)" ]]; then
	echo "Submodule has uncommitted changes; refusing to update:" >&2
	git -C "$submodule_path" status --short >&2
	exit 1
fi

current_commit="$(git -C "$submodule_path" rev-parse --short HEAD)"
branch="$(git -C "$submodule_path" rev-parse --abbrev-ref HEAD)"

if [[ "$branch" == "HEAD" ]]; then
	default_upstream="$(git -C "$submodule_path" symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null || echo origin/main)"
	branch="${default_upstream#origin/}"
	echo "==> Submodule is detached at $current_commit; switching to $branch"
	if git -C "$submodule_path" show-ref --verify --quiet "refs/heads/$branch"; then
		git -C "$submodule_path" switch "$branch"
	else
		git -C "$submodule_path" switch --track -c "$branch" "$default_upstream"
	fi
fi

upstream="$(git -C "$submodule_path" rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)"
if [[ -z "$upstream" ]]; then
	upstream="origin/$branch"
fi

echo "==> Fetching $upstream"
remote="${upstream%%/*}"
remote_branch="${upstream#*/}"
git -C "$submodule_path" fetch "$remote" "$remote_branch"

echo "==> Fast-forwarding $submodule_path: $branch -> $upstream"
git -C "$submodule_path" merge --ff-only "$upstream"

new_commit="$(git -C "$submodule_path" rev-parse --short HEAD)"

if [[ "$current_commit" == "$new_commit" ]]; then
	echo "==> Already up to date at $new_commit"
else
	echo "==> Updated $submodule_path: $current_commit -> $new_commit"
fi

echo ""
echo "==> Parent repo submodule diff"
git diff --submodule=short -- "$submodule_path" || true

if [[ "$commit_changes" -eq 1 ]]; then
	if git diff --quiet -- "$submodule_path"; then
		echo "==> Nothing to commit for $submodule_path"
	else
		echo "==> Committing updated submodule pointer"
		git add "$submodule_path"
		git commit -m "Update skills submodule"
	fi

	if [[ "$push_changes" -eq 1 ]]; then
		echo "==> Pushing parent repo"
		git push
	fi
else
	echo ""
	echo "Next steps:"
	echo "  git add $submodule_path"
	echo "  git commit -m 'Update skills submodule'"
fi
