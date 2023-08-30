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
alias tma='tmux a -t'

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


# # Fig post block. Keep at the bottom of this file.
export PATH=$HOME/.local/bin:$PATH


export RTX_SHELL=zsh
rtx() {
  local command
  command="${1:-}"
  if [ "$#" = 0 ]; then
    command rtx
    return
  fi
  shift

  case "$command" in
  deactivate|shell)
    eval "$(command rtx "$command" "$@")"
    ;;
  *)
    command rtx "$command" "$@"
    ;;
  esac
}

_rtx_hook() {
  trap -- '' SIGINT;
  eval "$(rtx hook-env -s zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_rtx_hook]+1}" ]]; then
  precmd_functions=( _rtx_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_rtx_hook]+1}" ]]; then
  chpwd_functions=( _rtx_hook ${chpwd_functions[@]} )
fi 

# Load and initialise completion system
autoload -Uz compinit
compinit


# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"