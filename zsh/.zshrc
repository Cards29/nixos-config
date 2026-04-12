# Set the directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" 
fi

# Source the zinit file
source "${ZINIT_HOME}/zinit.zsh"

# Path
typeset -U path
path=(
  $HOME/.cargo/bin
  $HOME/.npm-global/bin
  $HOME/go/bin
  $path
)

### --- Plugins & Snippets --- ###
# zinit ice compile'(pure|async).zsh'pick'async.zsh' src'pure.zsh'
# zinit light sindresorhus/pure
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

### --- Completion Initialization --- ###
autoload -Uz compinit && compinit
zinit cdreplay -q

# Variables
EZA_COMMAND="eza --long --git --color=always --icons=always --no-filesize --no-time --no-user --no-permissions"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey ' ' magic-space
bindkey -s '^xgm' 'git commit -m ""\C-b'
bindkey -s '^xgs' 'git status'
bindkey -s '^xga' 'git add'

# Open buffer line in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

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

# Completing style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview "$EZA_COMMAND --tree --level=2 \$realpath"
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview "$EZA_COMMAND --tree --level=2 \$realpath"

# Aliases
alias ls="$EZA_COMMAND"
alias v="nvim"
alias UPDATE="bash ~/dotfiles/scripts/update.sh"
alias BACKUP_PKG="bash ~/dotfiles/scripts/backup-packages.sh"
alias KANATA_RELOAD="systemctl --user daemon-reload && systemctl --user restart kanata.service"
alias KANATA_STOP="systemctl --user stop kanata.service"
alias bentopdf="docker run -d --name bentopdf -p 3000:8080 --rm bentopdfteam/bentopdf:latest && xdg-open http://localhost:3000"
alias stop_bentopdf="docker stop bentopdf"
alias TUP="sudo tailscale up"
alias TDOWN="sudo tailscale down"
alias arifin="uv run ~/Desktop/telegram-msg/main.py"


# Suffix alias
alias -s json=jless
alias -s md=bat
alias -s go='$EDITOR'
alias -s rs='$EDITOR'
alias -s c='$EDITOR'
alias -s cpp='$EDITOR'
alias -s txt=bat
alias -s log=bat
alias -s py='$EDITOR'
alias -s js='$EDITOR'
alias -s ts='$EDITOR'

# My Exports
export EDITOR="nvim"
export PGUSER='postgres'
export PGDATABASE='postgres'


# -------------------fzf------------------------------
# -- Use fd instead of find in fzf --

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

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----
export BAT_THEME=tokyonight_night


# ----------------------------------------------------

# Custom widgets
# Clear screen but keep current command buffer
function clear-screen-and-scrollback() {
  echoti civis > /dev/tty
  printf '%b' '\e[H\e[2J\e[3J' > /dev/tty
  echoti cnorm > /dev/tty
  zle redisplay
}
zle -N clear-screen-and-scrollback
bindkey '^xl' clear-screen-and-scrollback  # Ctrl+X then L

# Copy current buffer to clipboard (Wayland)
function copy-buffer-to-clipboard() {
  print -rn -- "$BUFFER" | wl-copy
  zle -M "Copied to clipboard"
}
zle -N copy-buffer-to-clipboard
bindkey '^xc' copy-buffer-to-clipboard  # Ctrl+X then C

fuck() {
  unset -f fuck
  eval "$(thefuck --alias)"
  fuck "$@"
}

fk() {
  unset -f fk
  eval "$(thefuck --alias fk)"
  fk "$@"
}

# Zinit update
zupdate() {
    echo "🔄 Updating Zinit itself..."
    zinit self-update
    echo "🔄 Updating all plugins and snippets..."
    zinit update --all
    echo "✅ Done! Restart your terminal or run: source ~/.zshrc"
}

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


# Shell integration
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(direnv hook zsh)"


