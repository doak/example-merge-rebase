#!/usr/bin/env bash

process() {
    local file="$1"

    cat "$file" |
    sed "1s/^./\u&/" |
    sed "s/\.\s\+./\U&/g"
}

process "$1"
