#!/usr/bin/env bash

msg="${1:-Claude Code finished}"

if [ -n "$TMUX" ]; then
	printf '\033Ptmux;\033\033]9;%s\a\033\\' "$msg" > /dev/tty
else
	printf '\033]9;%s\a' "$msg" > /dev/tty
fi
