#!/usr/bin/env bash

if test "$(uname -o)" == "Msys"; then
    vscode_dir=~/AppData/Roaming/Code/User/
else
    vscode_dir=~/.config/Code/User/
fi

cp ${vscode_dir}/settings.json .
cp ${vscode_dir}/keybindings.json .
