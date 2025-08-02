#!/bin/bash
# This script checks for conflicts in the specified files and directories.

archive=$1

if [ $# -ne 1 ]; then
    echo "Uso: $0 <arquivo ou diretório>"
    exit 1
fi

if [ ! -e $archive ]; then
    echo "O arquivo ou diretório $archive não existe."
    exit 1
fi

if grep -q -E '<<<<<<<|=======|>>>>>>>' $archive; then
    echo "O arquivo $archive contém conflitos."
else
    echo "O arquivo $archive não contém conflitos."
fi