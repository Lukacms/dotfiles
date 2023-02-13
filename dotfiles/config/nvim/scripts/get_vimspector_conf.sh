#!/usr/bin/env bash

CONFIG_FILE=$(find ~/.config/nvim/scripts/vimspector -type f | fzf)

if [[ -n $CONFIG_FILE ]]; then
    cp $CONFIG_FILE .
else
    echo "No configuration has been copied."
fi
