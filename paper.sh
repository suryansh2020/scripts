#!/usr/bin/env zsh

if [[ -r "$HOME/.paperrc" ]]; then
    exec 3< "$HOME/.paperrc"
    read <&3 target
else
    target=$PWD
fi

if [[ -n $argv ]]; then
    for doi in $argv; do
        wget --content-disposition --progress=bar --random-wait -c -E -N \
        http://libgen.biz/scimag/get.php\?doi\=$doi -P $target
    done
else
    print "Usage: paper [doi]...\n"
    print "Report issues and features to @vivekiitkgp <vivekrai.iitkgp@gmail.com>."
    exit 1
fi
