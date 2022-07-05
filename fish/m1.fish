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
alias pu="pnpm upgrade -i --latest"
alias tm="tmux"
alias tmk='tmux kill-server'
alias lv='$HOME/.local/bin/lvim'
alias lg='lazygit'
alias pc='pwd | pbcopy'
alias h='https'
alias rnd='find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;'
alias rdi='find . -name 'dist' -type d -prune -print -exec rm -rf '{}' \;'
alias q='cd (z -le | sort -rn | cut -c 12- | peco)'
alias ddd='docker-compose down && docker-compose up -d'
alias ddw='docker-compose down'
alias ddu='docker-compose up -d'
alias gone='git for-each-ref --format \'%(refname:short) %(upstream:track)\' | \
  awk \'$2 == "[gone]" {print $1}\' | \
  xargs -r git branch -D'

if test (which exa)
	alias ls="exa -l -a -h --icons -F --group-directories-first"
end

if test (which gh)
	alias ghb="gh browse" 
end

fish_add_path /opt/homebrew/opt/mysql-client/bin
fish_add_path $GOPATH/bin:$PATH
fish_add_path (yarn global bin)

# set -g theme_display_git_default_branch yes
# set -g theme_color_scheme nord

atuin init fish | source
# starship init fish | source
