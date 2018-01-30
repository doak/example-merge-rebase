#!/usr/bin/env bash

BASEDIR="`dirname "$0"`"
OK=true


info() {
    echo "INFO: $*" >&2
}

process_text() {
    "$BASEDIR/../text-processor.sh" "$@"
}


for f in "$BASEDIR/tc-"*".txt"; do
    TC_STEM="${f%.txt}"
    ARGS=(`cat "$TC_STEM.args" 2>/dev/null`)
    info "test case: '${TC_STEM##*/}'"
    VALIDATE="$TC_STEM.validate"

    process_text "$f" "${ARGS[@]}" |
    "$VALIDATE" "${ARGS[@]}" ||
    OK=false
done

$OK
