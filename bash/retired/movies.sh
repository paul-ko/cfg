#!/user/bin/env bash

HORROR_NOTES="${HOME}/Dropbox/Movies/horror-notes.md"
export HORROR_NOTES

hc() {
    # Count remaining movies
    line_no=$(grep -n '^\* [^\*]' "$HORROR_NOTES" | tail -1 | cut -f1 -d":")
    printf "Line no: %d (" $line_no
    sed -n "s/$/)/; ${line_no}p;" "$HORROR_NOTES"
    tail -n +$line_no "$HORROR_NOTES" | grep -Pc '^### [^\[]'
}

