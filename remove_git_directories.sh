#!/bin/bash

for arg in "$@"; do
    if [ -d "$arg" ]; then
        echo "If $arg has a .git directory, it's being deleted now"
        rm -rf "$arg/.git"
    fi
done