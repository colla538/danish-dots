# Created by `pipx` on 2025-12-30 10:22:05
export PATH="$PATH:/home/danish/.local/bin"

# ---- Basic behavior ----
setopt autocd              # cd by typing directory name
setopt correct             # command spelling correction
setopt nocaseglob          # case-insensitive globbing
setopt extendedglob        # advanced globbing
setopt histignorealldups   # no duplicate history entries
setopt sharehistory        # share history between shells

# ---- History ----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ---- Keybindings ----
bindkey -e                 # emacs-style bindings
bindkey '^R' history-incremental-search-backward

# ---- Completion ----
autoload -Uz compinit
compinit zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ---- Prompt ----
autoload -Uz colors
colors

# Format:
# user@host:~/path
# ❯
PROMPT='  [%n@%m] [%~] >> '

# Right-side prompt (exit status if non-zero)
RPROMPT='%(?..%F{red}%?%f)'

# ---- Aliases ----
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'

# ---- Environment ----
export EDITOR=nano
export PAGER=less

# Ctrl+Left / Ctrl+Right — move by word (like Word)
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;6C' fw_word_select
bindkey '^[[1;6D' bw_word_select
bindkey '^[[1;2C' fw_char_select
bindkey '^[[1;2D' bw_char_select
bindkey '^H' backward-kill-word

# ---- select helpers ----
fw_word_select() {
  zle set-mark-command
  zle forward-word
}
zle -N fw_word_select

bw_word_select() {
  zle set-mark-command
  zle backward-word
}
zle -N bw_word_select

fw_char_select() {
  zle set-mark-command
  zle forward-char
}
zle -N fw_char_select

bw_char_select() {
  zle set-mark-command
  zle backward-char
}
zle -N bw_char_select

precmd() {
  print ""
}

wal -q -R

eval "$(zoxide init zsh)"

alias cd="z"
alias install="sudo pacman -S --noconfirm"
