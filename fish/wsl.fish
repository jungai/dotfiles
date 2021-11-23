set -gx EDITOR vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

# Homebrew package manager
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if test (which exa)
	alias ls="exa -l -a -h"
end