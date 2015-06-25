#!/usr/bin/env zsh

if [[ -r "$HOME/.paperrc" ]]; then
    exec 3< "$HOME/.paperrc"
    read <&3 target
else
    target=$PWD
fi

if [[ -n $1 ]]; then
    doi=$argv
    wget --content-disposition --progress=bar --random-wait -nc -c -E \
    http://libgen.biz/scimag/get.php\?doi\=$doi -P $target
else
    print "Usage: paper <doi>"
    print "Written by: Vivek Rai (@vivekiitkgp)"
    exit 1
fi
