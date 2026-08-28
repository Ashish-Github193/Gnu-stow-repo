# Skip Ubuntu's global compinit in /etc/zsh/zshrc. Our interactive setup runs
# its own compinit (via Zinit in ~/.zshrc), so the system one is redundant work
# on every shell start. Must be set here in .zshenv — /etc/zsh/zshrc checks it
# before ~/.zshrc is sourced.
skip_global_compinit=1
ZSH_STARTUP_TIME=1
