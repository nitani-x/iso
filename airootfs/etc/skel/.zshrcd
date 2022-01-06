# ZSH configuration made by @Lanhild (lanhild@protonmail.com)
# This configuration file is also used by ArchLan Linux @archlan
typeset -A _kyoto
_kyoto="$HOME/.zsh"

# Plugins and utilities sourcing
source $_kyoto/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $_kyoto/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

# Various alias definitions
alias nv='nvim'
alias l='ls'
alias cp='cp -v'
alias darin="sudo"
alias vnc="x11vnc -vencrypt nodh:only -ssl"

if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  alias ls='ls --color=always --group-directories'
  alias ll='ls -la --color=always --group-directories'
fi

# Useful keybindings
bindkey -e
bindkey '^w' forward-word
bindkey '^b' backward-word
bindkey '^d' kill-whole-line
bindkey '^k' backward-kill-word
bindkey '^j' kill-word

# Word completions
autoload -Uz compinit
autoload -U +X bashcompinit && bashcompinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SList: %p%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt %SList: %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Options
setopt prompt_subst
setopt promptsubst
setopt append_history
setopt extended_history
setopt sharehistory
setopt hist_reduce_blanks
setopt always_to_end
setopt complete_in_word
setopt auto_menu
setopt correct
setopt correctall
setopt noflowcontrol
setopt hist_verify
setopt list_packed

# Things to do on shell opening
cat ~/.cache/wal/sequences
$_kyoto/fetch
$_kyoto/quotes.sh &!
