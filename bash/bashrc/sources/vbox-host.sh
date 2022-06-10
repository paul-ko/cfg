#!/usr/bin/env bash

vbox="paul@127.0.0.1"
alias ssh-vbox="ssh -p 3022 $vbox"

scp-vbox() {
    if [[ $# -lt 2 ]]; then
        # Possible TODO: support > 2 args.
        printf "Must supply exactly two arguments."
        return
    fi
    from="$vbox:$1"
    to="$2"
    scp -P 3022 "$from" "$to"
}

