# Created by jay for 5.9
# Jan 15, 2025

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if its not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# zinit plugins
source "${ZINIT_HOME}/zinit.zsh"
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
autoload -Uz compinit
compinit

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# fzf shell integration
which fzf &>/dev/null && eval "$(fzf --zsh)" || echo "fzf is not installed, ignore fzf shell integration..."

# initialize starship command prompt
eval "$(starship init zsh)"

# rustup shell setup
. "$HOME/.cargo/env"

#bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # doesnt work :(
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# aliases
alias c=clear
alias ls='colorls'
alias grep='grep --color=auto'
alias e=nvim
alias r=ranger
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

# colorls plugin for tab completion
source $(dirname $(gem which colorls))/tab_complete.sh

# Add to PATH
PATH=$PATH:"$HOME/bin"
PATH=$PATH:"/opt/st/cubeprg/bin"
PATH=$PATH:"$HOME/.local/share/gem/ruby/3.3.0/bin"

