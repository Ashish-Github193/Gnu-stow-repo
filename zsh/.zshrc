# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
  zsh-autosuggestions  
  fast-syntax-highlighting
  docker-status
  )

source $ZSH/oh-my-zsh.sh

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gsc='claude "commit all the staged changes and if version file present bump the version as per semver 2.0" && git push'
alias gp='git push'
alias gbs='git branch | sed "s/^..//" | fzf | xargs git checkout'
alias gbd='git branch --format="%(refname:short)" | fzf | xargs git branch -d'
alias gwa='branch=$(git branch --format="%(refname:short)" | fzf) \
	&& read "newPath?New worktree path: " \
	&& git worktree add "$newPath" "$branch"'
alias gwr="git worktree list | awk '{print \$1}' | fzf | xargs git worktree remove"
alias gwl='git worktree list | fzf --preview "git -C {1} status"'

# utils
alias tmux='tmux -u'
alias ls='exa --long'
alias lg='lazygit'
alias ld='lazydocker'

export PATH=$HOME/.local/bin:$PATH

eval "$(mise activate zsh)"

# Define installation folder path as a variable
NVIM_INSTALL_DIR="/opt/nvim-linux-x86_64"

# Check if nvim is installed in the specified folder
if [ ! -f "$NVIM_INSTALL_DIR/bin/nvim" ]; then
    echo "nvim is not found, installing..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf $NVIM_INSTALL_DIR
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    echo "nvim installed at $NVIM_INSTALL_DIR"
fi

# Ensure nvim is added to PATH only once
if ! echo $PATH | grep -q "$NVIM_INSTALL_DIR/bin"; then
    export PATH="$PATH:$NVIM_INSTALL_DIR/bin"
fi

# File Descriptor Limit
ulimit -n 65536

# Set locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


GNU_STOW_GIT_REPO_PATH=~/Projects/Gnu-stow-repo

# Skip if git is not installed
command -v git >/dev/null || return
# Skip if repo path does not exist or is not a git repo
[[ -d "$GNU_STOW_GIT_REPO_PATH/.git" ]] || return
# Check for uncommitted changes
if git -C "$GNU_STOW_GIT_REPO_PATH" diff --quiet && git -C "$GNU_STOW_GIT_REPO_PATH" diff --staged --quiet; then
    # No uncommitted changes → Display a fortune message
    if command -v fortune &>/dev/null && command -v cowsay &>/dev/null; then
        fortune | cowsay
    fi
else
    # Uncommitted changes exist → Display a funny warning
    if command -v cowsay &>/dev/null; then
        echo "\uf071 Your repo is a mess! Commit your changes!" | cowsay
    else
        echo "Uncommitted changes exist in $GNU_STOW_GIT_REPO_PATH"
    fi
fi

# sources
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.env ]; then
	set -a && source ~/.env && set +a
fi

# SSH agent socket
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Export paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/mise/shims:$PATH"

eval "$(uv generate-shell-completion zsh)"


# bun completions
[ -s "/home/x/.bun/_bun" ] && source "/home/x/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

cd() {
  builtin cd "$@" || return

  if [[ -n "$VIRTUAL_ENV" ]]; then
    deactivate 2>/dev/null
  fi

  if [[ -f .venv/bin/activate ]]; then
    source .venv/bin/activate
  fi
}

