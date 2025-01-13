#
# jay's bashrc configuration
# Created: January 12, 2025
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alises section
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias e=nvim
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# fzf shell integration
which fzf &>/dev/null && eval "$(fzf --bash)" || echo "fzf is not installed, ignore fzf shell integration..."

# default shell prompt
PS1='[\u@\h \W]\$ '

# rustup shell setup
. "$HOME/.cargo/env"