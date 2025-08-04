#!/bin/bash

function check_conflict() {
    local file=$1
    if grep -q -E '<<<<<<<|=======|>>>>>>>' "$file"; then
        echo "O arquivo $file contém conflitos."
    fi
}

function check_directory() {
    local directory=$1
    for file in "$directory"/*; do
        if [ -f "$file" ]; then
            check_conflict "$file"
        elif [ -d "$file" ]; then
            check_directory "$file"
        fi
    done
}

check_directory "$1"

function check_directory_while() {
    local directory=$1  
    local file
    local files=("$directory"/*)
    local index=0

    while [ $index -lt ${#files[@]} ]; do
        file=${files[$index]}
        if [ -f "$file" ]; then
            check_conflict "$file"
        elif [ -d "$file" ]; then
            check_directory "$file"
        fi
        ((index++))
    done
}

# Verifica se a quantidade de argumentos é diferente de 1
if [ $# -ne 1 ]; then
    echo "Uso: $0 <diretório>"
    exit 1
fi

# Verifica se o argumento é um diretório válido
if [ ! -d "$1" ]; then
    echo "O diretório $1 não existe."
    exit 1
fi

#check_directory_while "$1"