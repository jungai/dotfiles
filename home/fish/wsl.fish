set -gx EDITOR vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

# Homebrew package manager
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# alias
alias p="pnpm"
alias tm="tmux"
alias tmk='tmux kill-server'

if test (which exa)
	alias ls="exa -l -a -h"
end