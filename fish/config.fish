set -gx EDITOR vim

# Homebrew package manager
if test -x ~/.linuxbrew/bin
    eval (~/.linuxbrew/bin/brew shellenv)
end

# asdf
source ~/.asdf/asdf.fish

# asdf should exec first
export PATH="$PATH:`yarn global bin`"

# alias
alias c="clear"
alias d="yarn dev"
alias s="yarn start"
alias tm="tmux"
alias yc="yarn compile"
alias tmk='tmux kill-server'
alias pc="pwd | pbcopy"
alias p="pnpm"
alias ps="pnpm start"
alias pd="pnpm dev"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias va='vault'

if test (which exa)
	alias ls="exa -l -a --icons -h"
end

