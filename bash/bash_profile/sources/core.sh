# shellcheck shell=bash

export EDITOR=code
if [[ -z "$PYTHONPATH" ]]; then
    export PYTHONPATH="."
fi
