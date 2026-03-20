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
            # Display base welcome message for interactive shell sessions
            # Build an `EXTRA_NOTES` env var and interpolate it into the
            # `${EXTRA_NOTES}` placeholder inside `welcome.txt`.
            EXTRA_NOTES=""
            if [ -d /opt/fortify/sc-client ] && [ -f /usr/share/fcli/welcome-sc-note.txt ]; then
                # Prefix a blank line so the note is separated from prior text
                EXTRA_NOTES="$(printf '\n%s' "$(cat /usr/share/fcli/welcome-sc-note.txt)")"
            fi

            # Replace literal `${EXTRA_NOTES}` placeholder with the value of
            # the EXTRA_NOTES variable. Using awk preserves newlines.
            awk -v extra="$EXTRA_NOTES" '{ gsub(/\$\{EXTRA_NOTES\}/, extra); print }' /usr/share/fcli/welcome.txt
            ;;
    esac
fi

# Execute the provided command
exec "$@"
