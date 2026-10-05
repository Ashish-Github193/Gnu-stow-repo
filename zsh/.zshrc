# ~/.zshrc — managed via GNU stow (Gnu-stow-repo/zsh)
#
# Plugin management: Zinit (see the Zinit section near the bottom).
# Oh My Zsh was removed on 2026-08-24 to fix ~1s startup (it re-ran the
# completion system on every launch). The behavior we actually used from it
# — the robbyrussell prompt, history/dir setopts, keybindings, and
# completion styling — is reimplemented natively below with no dependency.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Optional startup timing: `export ZSH_STARTUP_TIME=1` to print how long the
# shell took to reach the first prompt. (There's no standard env var for this,
# so this is our own toggle.)
# Terminal colors as literal ANSI escapes — no `tput` forks (15 subprocesses
# added ~90ms to startup). Values match `tput` on xterm/tmux-256color.
zmodload zsh/datetime 2>/dev/null
[[ -n ${ZSH_STARTUP_TIME:-} ]] && _zshrc_start_time=$EPOCHREALTIME

# Startup profiling: when ZSH_STARTUP_TIME is set, `_zmark <label>` prints the
# time since the previous checkpoint and the running total, so you can see which
# section below is slow. No-op when the toggle is off.
if [[ -n ${_zshrc_start_time:-} ]]; then
  typeset -F _zmark_last=$_zshrc_start_time
  _zmark() {
    local now=$EPOCHREALTIME
    printf '  [zshrc] %-14s +%6.1f ms   (total %6.1f ms)\n' "$1" \
      $(( (now - _zmark_last) * 1000 )) $(( (now - _zshrc_start_time) * 1000 ))
    _zmark_last=$now
  }
else
  _zmark() { : }
fi

# ============================================================================
# Shell options (replaces Oh My Zsh lib/{history,directories,completion}.zsh)
# ============================================================================

# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history        # record timestamp of command in HISTFILE
setopt hist_expire_dups_first  # delete dups first when HISTFILE exceeds HISTSIZE
setopt hist_ignore_dups        # ignore duplicated commands in the history list
setopt hist_ignore_space       # ignore commands that start with a space
setopt hist_verify             # show expanded history line before running it
setopt share_history           # share history live across all sessions

# Directories
setopt auto_pushd              # cd pushes onto the dir stack (1-9 to jump back)
setopt pushd_ignore_dups
setopt pushdminus

# Completion behavior
setopt auto_menu               # show completion menu on repeated tab
setopt complete_in_word
setopt always_to_end
unsetopt menu_complete
unsetopt flowcontrol
WORDCHARS=''
_zmark shell-opts

# ============================================================================
# Prompt — robbyrussell, self-contained (replaces the Oh My Zsh theme)
# ============================================================================
autoload -Uz colors && colors
setopt prompt_subst

# Prompt: robbyrussell style, git segment removed (the old git_prompt_info
# forked two git processes on every render). Set explicitly so we never inherit
# a stale exported PS1 from a parent shell, and unexport it so it can't leak
# into child shells.
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%} "
typeset +x PROMPT PS1
_zmark prompt

_zmark keybindings

# add-zsh-hook is used by the startup timer at the bottom of this file
autoload -Uz add-zsh-hook

# ============================================================================
# Completion + Zinit plugin manager
# ============================================================================
# Completion styling (replaces Oh My Zsh lib/completion.zsh)
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

# Extra completion functions on fpath (must be set before compinit below)
fpath=("/home/x/.local/share/zsh/site-functions" $fpath)
_zmark comp-styles

# Bootstrap Zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
_zmark zinit-source

# Load extra completions (blockf), then run a single cached compinit. This must
# run HERE — before tools like mise/uv register completions via `compdef` later
# in this file — otherwise `compdef` is undefined. Fast path (-C) unless the
# dump is older than 24h.
zinit ice blockf
zinit light zsh-users/zsh-completions
autoload -Uz compinit
_zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -n ${_zcompdump}(#qNmh-24) ]]; then
  compinit -C -d "$_zcompdump"
else
  compinit -d "$_zcompdump"
fi
# Compile the dump to wordcode so zsh loads bytecode instead of re-parsing the
# ~52KB text dump. Guarded: only runs when the .zwc is missing or stale, and
# since `compinit -C` doesn't rewrite the dump this fires ~once a day, not per
# shell (proven: dump mtime stays constant across warm startups).
if [[ ! -s ${_zcompdump}.zwc || $_zcompdump -nt ${_zcompdump}.zwc ]]; then
  zcompile -R -- "$_zcompdump"
fi
unset _zcompdump
zinit cdreplay -q   # replay compdefs captured by blockf
_zmark compinit

# ZLE-heavy plugins deferred via Turbo (`wait lucid`) so the prompt appears
# instantly and these load a few ms later in the background.
zinit wait lucid for \
    atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting
_zmark turbo-reg

# ============================================================================
# Aliases
# ============================================================================

# git
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias gss='git status --short'
alias gl="git log"
alias gitroot='cd "$(git rev-parse --show-toplevel)"'
alias gwa='branch=$(git branch --format="%(refname:short)" | fzf) \
	&& read "newPath?New worktree path: " \
	&& git worktree add "$newPath" "$branch"'
alias gwr="git worktree list | awk '{print \$1}' | fzf | xargs git worktree remove"
alias gwl='git worktree list | fzf --preview "git -C {1} status"'

# utils
alias tmux='tmux -u'
alias ls='eza --long'
alias xo='xdg-open'
alias lg='lazygit'
alias ld='lazydocker'
alias icat='kitty +kitten icat'

prmsg() {
  local content=$(git log master..HEAD --pretty=format:"- %s%n%b" | grep -v '^$')

  if [[ "$1" == "-s" || "$1" == "--silent" ]]; then
    # Silent mode - only copy to clipboard
    printf "\033]52;c;$(printf '%s' "$content" | base64 | tr -d '\n')\a"
    echo "✓ Copied to clipboard"
  else
    # Default - just print
    echo "$content"
  fi
}
_zmark aliases

# ============================================================================
# Environment
# ============================================================================
export PATH=$HOME/.local/bin:$PATH

# Define installation folder path as a variable
NVIM_INSTALL_DIR="/opt/nvim-linux-x86_64"
export PATH="$PATH:$NVIM_INSTALL_DIR/bin"

# File Descriptor Limit
ulimit -n 65536

# Set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# SSH agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
_zmark env

# Enable mise (full activation). The activation script is cached and only
# regenerated when the mise binary changes, so we don't fork `mise activate`
# on every launch. compinit runs above (synchronously) so mise's `compdef`
# call works. Note: mise still runs `mise hook-env` per prompt (~50-60ms) —
# that's inherent to activate mode and provides per-directory env switching.
if command -v mise &>/dev/null; then
  _mise_cache="${XDG_CACHE_HOME:-$HOME/.cache}/mise-activate.zsh"
  if [[ ! -s $_mise_cache || $_mise_cache -ot ${commands[mise]} ]]; then
    mise activate zsh >| $_mise_cache
  fi
  source $_mise_cache
  unset _mise_cache
fi
_zmark mise

export DISABLE_AUTO_TITLE='true'

# Export paths (mise shims; $HOME/.local/bin is already on PATH near the top)
export PATH="$HOME/.local/share/mise/shims:$PATH"
_zmark end-of-file

# ============================================================================
# Misc
# ============================================================================
# Report startup time once, at the first prompt (enabled by ZSH_STARTUP_TIME).
if [[ -n ${_zshrc_start_time:-} ]]; then
  _zshrc_report_startup() {
    startup_ms=$(( (EPOCHREALTIME - _zshrc_start_time) * 1000 ))
	startup_time=$(printf 'zsh startup time: %.0f ms' "$startup_ms")
	echo "$startup_time"

    add-zsh-hook -d precmd _zshrc_report_startup
    unset _zshrc_start_time
    unfunction _zshrc_report_startup
  }
  add-zsh-hook precmd _zshrc_report_startup
fi

claude_qwen() {
  ANTHROPIC_BASE_URL="https://openrouter.ai/api" \
  ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY" \
  ANTHROPIC_API_KEY="" \
  ANTHROPIC_DEFAULT_SONNET_MODEL="qwen/qwen3.8-27b:free" \
  ANTHROPIC_DEFAULT_OPUS_MODEL="qwen/qwen3.8-27b:free" \
  ANTHROPIC_DEFAULT_HAIKU_MODEL="qwen/qwen3.8-27b:free" \
  claude "$@"
}

fpath=(/home/x/.zsh/completions $fpath)
autoload -Uz compinit && compinit
