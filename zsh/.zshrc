# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/exa"
plug "zap-zsh/vim"
plug "chivalryq/git-alias"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-history-substring-search"
plug "chrishrb/zsh-kubectl"
plug "wintermi/zsh-gcloud"

# zoxide
_ZO_FZF_OPTS='--select-1'
eval "$(zoxide init zsh)"

# alias
alias q=zi
alias p='pnpm'
alias px='pnpx'
alias pu='pnpm upgrade -i --latest'
alias tm='tmux'
alias tmk='tmux kill-server'
alias lg='lazygit'
alias pc='pwd | pbcopy'
alias h='https'
alias rnd='find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;'
alias rdi='find . -name 'dist' -type d -prune -print -exec rm -rf '{}' \;'
alias rtr='find . -name '.turbo' -type d -prune -print -exec rm -rf '{}' \;'
alias ddd='docker-compose down && docker-compose up -d'
alias ddw='docker-compose down'
alias ddu='docker-compose up -d'
alias ss='pnpm start'
alias sd='pnpm start:dev'
alias dd='pnpm dev'
alias bb='pnpm build'
alias s='atuin search -i'
alias a='asdf'
alias ldk='lazydocker'
alias tr='tre'
alias kc='kubectl'
alias zl="zellij"
alias sn="snyk"
# TODO:use bash script instead
alias tma=$HOME/dotfiles/scripts/tmux.mjs
alias dds=$HOME/dotfiles/scripts/docker.mjs

# return exit code 0 if command exists
has() {
	hash "$1" &>/dev/null
}

if has exa; then
	alias ls="exa -l -a -h -F --group-directories-first --icons"
fi

if has nvim; then
	alias vim="nvim"
fi

if has gh; then
	alias ghb="gh browse"
	alias opr="gh pr create --web"
fi

if has bat; then
	alias cat="bat"
fi

if has flutter; then
	# export FLUTTER_ROOT="$(asdf where flutter)"
	export PATH="$(asdf where flutter)/bin":"$PATH"
	# export FLUTTER_ROOT="$(asdf where flutter)"
fi

gone_function() {
  git for-each-ref --format='%(refname:short) %(upstream:track)' |
    awk '$2 == "[gone]" {print $1}' |
    xargs -r git branch -D
}

alias gone=gone_function
# # Fig post block. Keep at the bottom of this file.
export PATH=$HOME/.local/bin:$PATH

eval "$(atuin init zsh)"

# Load and initialise completion system
autoload -Uz compinit
compinit


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOBIN=$(go env GOPATH)/bin
[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
eval "$(~/.local/bin/mise activate zsh)"
