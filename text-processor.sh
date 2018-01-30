#!/usr/bin/env bash

capitalise() {
    sed "1s/^./\u&/" |
    sed "s/\.\s\+./\U&/"
}

capitalise_regex() {
    if test "$#" -eq 0; then
        cat
        return 0
    fi

    local expression
    for name in "$@"; do
        expression+="s/\\<$name\\>/\\u&/g;"
    done
    sed "$expression"
}

process() {
    local file="$1"
    shift

    cat "$file" |
    capitalise_regex "$@" |
    capitalise
}

process "$@"
