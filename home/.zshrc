# interactive check
[[ $- != *i* ]] && return

# Load quickshell generated colors (ADD THIS)
if [[ -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt ]]; then
    cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
fi

# load zsh scripts
for file in ~/.config/zsh/*.zsh; do
  source "$file"
done

# zinit loading
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#zinit plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit load zsh-users/zsh-history-substring-search
zinit snippet OMZP::docker-compose/docker-compose.plugin.zsh
zinit snippet OMZP::archlinux/archlinux.plugin.zsh
zinit snippet OMZP::colored-man-pages
zinit light jeffreytse/zsh-vi-mode
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"'
zinit light trapd00r/LS_COLORS

# history
HISTFILE=~/.config/zsh/zhistory
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# personal opts
setopt PROMPT_SUBST         # enable command substitution in prompt
setopt NO_CLOBBER           # Don't let > silently overwrite files. Use >! instead.
setopt INTERACTIVE_COMMENTS # Treat comments like comments, not code.
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt LIST_PACKED          # The completion menu takes less space.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

# autostart
fastfetch

# load starship
eval "$(starship init zsh)"
