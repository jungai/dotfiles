# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "chivalryq/git-alias"
plug "Aloxaf/fzf-tab"
plug "zsh-users/zsh-history-substring-search"
plug "chrishrb/zsh-kubectl"
# plug "wintermi/zsh-gcloud"
# theme
plug "$HOME/dotfiles/zsh/custom_theme.zsh"

# zoxide
_ZO_FZF_OPTS='--select-1'
eval "$(zoxide init zsh)"

export XDG_CONFIG_HOME="$HOME/.config"

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
alias a='asdf'
alias ldk='lazydocker'
alias tr='tre'
alias kc='kubectl'
alias zl="zellij"
alias sn="snyk"
alias ppp="python3"
alias tma=$HOME/dotfiles/scripts/tmux.sh
alias dds=$HOME/dotfiles/scripts/docker.sh

# return exit code 0 if command exists
has() {
	hash "$1" &>/dev/null
}

if has eza; then
	alias ls="eza -l -a -h -F --group-directories-first --icons"
fi

if has nvim; then
	alias v="nvim"
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

# about git
gone_function() {
  git for-each-ref --format='%(refname:short) %(upstream:track)' |
    awk '$2 == "[gone]" {print $1}' |
    xargs -r git branch -D
}

checkout_with_fzf() {
  git checkout $(git branch | fzf)
}

alias gb="git branch | fzf"
alias gone=gone_function
alias gco=checkout_with_fzf

# # Fig post block. Keep at the bottom of this file.
export PATH=$HOME/.local/bin:$PATH

# Load and initialise completion system with caching
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(Nmh+24) ]]; then
  compinit
else
  compinit -C
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
# export GOBIN=$(go env GOPATH)/bin
[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

mise_path=$(which mise)
eval "$($mise_path activate zsh)"

# Initialize atuin early (suppress non-critical zle warnings)
if command -v atuin &>/dev/null; then
  _atuin_init=$(atuin init zsh --disable-up-arrow 2>&1)
  eval "$_atuin_init" 2>/dev/null
  unset _atuin_init
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Lazy load starship on first prompt (heaviest init)
_load_starship_once() {
  [[ -z "$_STARSHIP_LOADED" ]] || return
  _STARSHIP_LOADED=1
  eval "$(starship init zsh)" 2>/dev/null || true
}
precmd_functions+=(_load_starship_once)

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

export BAT_THEME="Catppuccin Macchiato"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# autocomplete
# source "$HOME/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
# bindkey              '^I' menu-select

# pnpm
export PNPM_HOME="/Users/jungai/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Added by Antigravity
export PATH="/Users/worapholw/.antigravity/antigravity/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"