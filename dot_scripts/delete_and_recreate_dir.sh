#! /bin/sh

if [ -d "$1" ]; then
    rm -rf "$1"
fi

mkdir -p "$1"
