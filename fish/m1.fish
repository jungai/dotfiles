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

# flutter
if test (which flutter)
  set -x FLUTTER_ROOT (asdf where flutter)
end

# alias
alias p='pnpm'
alias px='pnpx'
alias pu='pnpm upgrade -i --latest'
alias tm='tmux'
alias tmk='tmux kill-server'
alias lv='$HOME/.local/bin/lvim'
alias lg='lazygit'
alias pc='pwd | pbcopy'
alias h='https'
alias rnd='find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;'
alias rdi='find . -name 'dist' -type d -prune -print -exec rm -rf '{}' \;'
alias rtr='find . -name '.turbo' -type d -prune -print -exec rm -rf '{}' \;'
alias ra='rnd & rdi & rtr'
# alias q='cd (z -le | sort -rn | cut -c 12- | peco)'
alias q='cd (z -le | sort -rn | cut -c 12- | fzf)'
alias ddd='docker-compose down && docker-compose up -d'
alias ddw='docker-compose down'
alias ddu='docker-compose up -d'
alias gone='git for-each-ref --format \'%(refname:short) %(upstream:track)\' | \
  awk \'$2 == "[gone]" {print $1}\' | \
  xargs -r git branch -D'
alias ss='pnpm start'
alias sd='pnpm start:dev'
alias dd='pnpm dev'
alias bb='pnpm build'

if test (which lazydocker)
	alias ld="lazydocker"
end


if test (which exa)
	alias ls="exa -l -a -h -F --group-directories-first --icons"
end

if test (which bat)
	alias cat="bat"
end

if test (which gh)
	alias ghb="gh browse" 
	alias opr="gh pr create --web"
end

if test (which nvim)
	alias vim="nvim" 
end

if test (which redis-commander)
	alias rc="redis-commander" 
end

if test (which gitui)
	alias gg="gitui" 
end

fish_add_path /opt/homebrew/opt/mysql-client/bin
fish_add_path $GOPATH/bin:$PATH
fish_add_path (yarn global bin)

# set -g theme_display_git_default_branch yes
# set -g theme_color_scheme nord

atuin init fish | source
# starship init fish | source

# Bun
set -Ux BUN_INSTALL "/Users/jungai/.bun"
set -px --path PATH "/Users/jungai/.bun/bin"

# Catppuccin
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Java
. ~/.asdf/plugins/java/set-java-home.fish

# rbenv
status --is-interactive; and rbenv init - fish | source
