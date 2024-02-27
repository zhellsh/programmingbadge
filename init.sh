#!/usr/bin/env bash

# Check if user is running Fedora
if command -v dnf &> /dev/null
then
    printf "This script will do the following:\n1.\tInstall the toolchains required to compile the code\n\t\t\tAND\n2.\tCompile the source code after cloning.\0\n"
    sudo dnf install gcc node
    curl https://nim-lang.org/choosenim/init.sh -sSf | sh
    git clone https://github.com/zhellsh/programmingbadge
    cd programmingbadge
    source ~/.bashrc
    nim js --opt:speed -d:release tip.nim
    nim c --opt:speed -d:release tip.nim
else
    printf "This script will do the following:\n1.\tInstall the toolchains required to compile the code\n\t\t\tAND\n2.\tCompile the source code after cloning.\0\n"
    sudo apt install gcc node
    curl https://nim-lang.org/choosenim/init.sh -sSf | sh
    git clone https://github.com/zhellsh/programmingbadge
    cd programmingbadge
    source ~/.bashrc
    nim js --opt:speed -d:release tip.nim
    nim c --opt:speed -d:release tip.nim
fi
