#!/usr/bin/env bash

if command -v shellcheck >/dev/null; then
    find . -type f -name '*.sh' -exec shellcheck {} +;
else
    printf "shellcheck is not installed!\n"
fi
