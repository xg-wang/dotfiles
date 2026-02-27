#!/bin/bash

# Usage: ./notify.sh "Your message" "Optional Title"
# Example: ./notify.sh "Task complete" "Claude Code"
# This version doesn't block - you don't need to click OK

MESSAGE="${1:-Task completed}"
TITLE="${2:-Claude Code}"

# Use dialog in background so it doesn't block
osascript -e "display dialog \"$MESSAGE\" with title \"$TITLE\" buttons {\"OK\"} default button 1 giving up after 3" &
