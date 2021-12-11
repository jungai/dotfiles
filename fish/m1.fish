set -gx EDITOR vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.asdf/asdf.fish

# Homebrew package manager
eval (/opt/homebrew/bin/brew shellenv)

# mysql
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# alias
alias p="pnpm"
alias tm="tmux"
alias tmk='tmux kill-server'
alias lv='/Users/jungai/.local/bin/lvim'

if test (which exa)
	alias ls="exa -l -a -h --icons -F --group-directories-first"
end

echo ""
viu -m -w 30 ~/Desktop/winter.png
echo ""

fish_add_path /opt/homebrew/opt/mysql-client/bin

set -g theme_display_git_default_branch yes
set -g theme_color_scheme nord
