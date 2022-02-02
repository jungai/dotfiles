set -gx EDITOR vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

# Homebrew package manager
eval (/opt/homebrew/bin/brew shellenv)

# golang
# export GOPATH=$HOME/Desktop/playground/go
set -x GOPATH $HOME/Desktop/playground/go
set -x PATH $PATH $GOPATH/bin

# alias
alias p="pnpm"
alias tm="tmux"
alias tmk='tmux kill-server'
alias lv='$HOME/.local/bin/lvim'
alias lg='lazygit'
alias pc='pwd | pbcopy'
alias h='https'
alias rnd='find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;'
alias q='cd (z -le | sort -rn | cut -c 12- | peco)'

if test (which exa)
	alias ls="exa -l -a -h --icons -F --group-directories-first"
end

fish_add_path /opt/homebrew/opt/mysql-client/bin
fish_add_path $GOPATH/bin:$PATH
fish_add_path (yarn global bin)

set -g theme_display_git_default_branch yes
set -g theme_color_scheme nord
