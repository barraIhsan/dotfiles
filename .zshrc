# Preserve History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion & Keybind
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
autoload -Uz compinit && compinit

# Initialize programs
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

# Run fastfetch
fastfetch

# Aliases
alias c="clear"
alias vim="nvim"
alias v="nvim"
alias ls="eza --group-directories-first --icons=auto --git -h"
alias ll="ls -la"
alias cat="bat"
alias lg="lazygit"

# Yazi yy shell wrapper
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd "$cwd"
  fi
  rm -f -- "$tmp"
}

# Environment variables
# use tty gpg
export GPG_TTY=$(tty)
# set default editor as neovim
export VISUAL=nvim
export EDITOR=$VISUAL

# Initialize Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source / Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add zsh plugin
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo
zinit snippet OMZP::colored-man-pages

zinit cdreplay -q

