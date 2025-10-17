ZSH_CONFIG_DIR="${ZDOTDIR:-$HOME}/.config/zsh"
mkdir -p "$ZSH_CONFIG_DIR/completions"
COMP_DUMPFILE="$ZSH_CONFIG_DIR/completions/.zcompdump"

autoload -Uz compinit
compinit -C -d "$COMP_DUMPFILE"

# Configure zsh completion behavior
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list \
        'm:{a-zA-Z}={A-Za-z}' \
        '+r:|[._-]=* r:|=*' \
        '+l:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'
