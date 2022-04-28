set -gx EDITOR vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

# Homebrew package manager
eval (/opt/homebrew/bin/brew shellenv)

# alias
alias p="pnpm"
alias pu="pnpm upgrade -i --latest"
alias tm="tmux"
alias tmk='tmux kill-server'
alias lv='$HOME/.local/bin/lvim'
alias lg='lazygit'
alias pc='pwd | pbcopy'
alias h='https'
alias rnd='find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;'
alias q='cd (z -le | sort -rn | cut -c 12- | peco)'
alias do='docker'
alias doc='docker-compose'

if test (which exa)
	alias ls="exa -l -a --icons -h -F --group-directories-first"
end

starship init fish | source
atuin init fish | source
