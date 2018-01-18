#!/usr/bin/env bash

process() {
    local file="$1"

    cat "$file" |
    sed "1s/^./\u&/" |
    sed "\$!N;s/\.\s\+./\U&/;P;D"
}

process "$1"
