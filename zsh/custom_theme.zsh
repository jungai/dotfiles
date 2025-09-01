# ZSH Theme - Preview: https://cl.ly/f701d00760f8059e06dc
# Thanks to gallifrey, upon whose theme this is based

# autoload -Uz vcs_info
# autoload -U colors && colors
#
# zstyle ':vcs_info:*' enable git
#
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
#
# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
#
# local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"
# zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"
#
# +vi-git-untracked(){
#     if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
#         git status --porcelain | grep '??' &> /dev/null ; then
#         hook_com[staged]+='!' # signify new files with a bang
#     fi
# }
#
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"
#
# PROMPT=" %{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+="\$vcs_info_msg_0_ "

autoload -U colors && colors
autoload -Uz vcs_info add-zsh-hook

# Allow variables and functions in the prompt
setopt PROMPT_SUBST

# Define the format for the git branch section -> " (branch)"
# The space at the beginning is important for spacing
zstyle ':vcs_info:git:*' formats ' (%b)'

# This function runs before every prompt is displayed
precmd_vcs_info() {
  # Get git information from the current directory
  vcs_info
}
# Add the function to the pre-command hooks
add-zsh-hook precmd precmd_vcs_info

PROMPT='[%n@%F{red}%m%f] %F{green}%~%f${vcs_info_msg_0_}%(#.#. $) '