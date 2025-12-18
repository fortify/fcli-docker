#!/bin/sh
# Docker entrypoint for fcli Linux images
# Displays welcome message for interactive sessions, then exec the command

# Check if:
# - stdin is a terminal (interactive)
# - first arg is a shell
# - only one argument (default CMD)
if [ -t 0 ] && [ $# -eq 1 ]; then
    case "$1" in
        /bin/sh|/bin/bash|sh|bash)
            # Display welcome message for interactive shell sessions
            cat /usr/share/fcli/welcome.txt
            ;;
    esac
fi

# Execute the provided command
exec "$@"
