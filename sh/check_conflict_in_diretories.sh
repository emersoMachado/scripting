#!/bin/bash

function check_conflict() {
    local file=$1
    if grep -q -E '<<<<<<<|=======|>>>>>>>' "$file"; then
        echo "O arquivo $file contém conflitos."
    fi
}

directory=$1

for archive in "$directory"/*; do
    if [ -f "$archive" ]; then
        check_conflict "$archive"
    fi
done