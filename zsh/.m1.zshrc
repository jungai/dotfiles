export EDITOR=vi
# Path to your oh-my-zsh installation.
export ZSH="/Users/jungai/.oh-my-zsh"

# Theme
ZSH_THEME="flazz"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions z vi-mode)

source $ZSH/oh-my-zsh.sh

# asdf 
. $HOME/.asdf/asdf.sh

# asdf should exec first
export PATH="$PATH:`yarn global bin`"

# starship
# eval "$(starship init zsh)"

# mysql client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# enable Macbook Touch ID for sudo
sudotouchid () {
 if ! /usr/bin/grep -Fq "pam_tid.so" /etc/pam.d/sudo
 then
 /usr/bin/osascript -e 'do shell script "/usr/bin/sed -i '' -e \"1s/^//p; 1s/^.*/auth       sufficient     pam_tid.so/\" /etc/pam.d/sudo" with administrator privileges'
 fi
}

# alias
alias vi="vim"
alias c="clear"
alias d="yarn dev"
alias s="yarn start"
alias tm="tmux"
alias yc="yarn compile"
alias gcm='git commit -m'
alias tmk='tmux kill-server'
alias codei='code-insiders'
alias gj='git jump'
alias sut="sudotouchid"
alias pc="pwd | pbcopy"
alias p="pnpm"
alias /="fzf"
alias ni="nvim"

if hash exa 2>/dev/null; then
  alias ls="exa -l --icons -h"
fi
