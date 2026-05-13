#!/usr/bin/env bash

# Read JSON from stdin (Claude Code pipes hook context as JSON)
input=$(cat)

if [ -n "$input" ] && command -v jq &>/dev/null; then
	event=$(echo "$input" | jq -r '.hook_event_name // empty')
	notif_type=$(echo "$input" | jq -r '.notification_type // empty')
	message=$(echo "$input" | jq -r '.message // empty')
	tool_name=$(echo "$input" | jq -r '.tool_name // empty')
	last_msg=$(echo "$input" | jq -r '.last_assistant_message // empty')

	case "$event" in
	Stop)
		snippet="${last_msg:0:60}"
		if [ -n "$snippet" ]; then
			msg="Task completed: $snippet"
		else
			msg="Task completed"
		fi
		;;
	Notification)
		case "$notif_type" in
		permission_prompt)
			# Try to extract tool name from message like "...to use Bash"
			tool=$(echo "$message" | sed -n 's/.*to use \(.*\)/\1/p')
			if [ -n "$tool" ]; then
				msg="Needs permission: $tool"
			elif [ -n "$tool_name" ]; then
				msg="Needs permission: $tool_name"
			else
				msg="Needs permission"
			fi
			;;
		idle_prompt)
			msg="Waiting for input"
			;;
		*)
			if [ -n "$message" ]; then
				msg="$message"
			else
				msg="Claude Code"
			fi
			;;
		esac
		;;
	*)
		msg="Claude Code"
		;;
	esac
else
	msg="Claude Code"
fi

# Desktop notification rides OSC 9 escape through tmux passthrough → SSH → kitty.
# /dev/tty is unreliable from a detached hook process (Claude Code regression
# ~early May 2026 stopped giving hooks a controlling terminal), so resolve the
# active tmux pane's TTY directly instead.
target_tty=""
if [ -n "$TMUX" ] && command -v tmux &>/dev/null; then
	target_tty=$(tmux display-message -p '#{pane_tty}' 2>/dev/null)
fi
if [ -z "$target_tty" ] && { : > /dev/tty; } 2>/dev/null; then
	target_tty="/dev/tty"
fi

if [ -n "$target_tty" ] && [ -w "$target_tty" ]; then
	if [ -n "$TMUX" ]; then
		printf '\033Ptmux;\033\033]9;%s\a\033\\' "$msg" > "$target_tty" 2>/dev/null || true
	else
		printf '\033]9;%s\a' "$msg" > "$target_tty" 2>/dev/null || true
	fi
fi

exit 0
