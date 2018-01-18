#!/usr/bin/env bash

BASEDIR="`dirname "$0"`"
OK=true


info() {
    echo "INFO: $*" >&2
}

process_text() {
    file="$1"
    "$BASEDIR/../text-processor.sh" "$file"
}


for f in "$BASEDIR/tc-"*".txt"; do
    TC_STEM="${f%.txt}"
    info "test case: '${TC_STEM##*/}'"
    VALIDATE="$TC_STEM.validate"

    process_text "$f" |
    "$VALIDATE" ||
    OK=false
done

$OK
