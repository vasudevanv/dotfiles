#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

function copyfiles() {
    rsync --exclude ".git/"  \
	--exclude ".DS_Store"    \
	--exclude "bootstrap.sh" \
	--exclude "README.md"    \
	--exclude "setup_osx.sh" \
    --exclude "setup_linux.sh" \
    --exclude "configs/" \
    --exclude "osx/" \
    --exclude "linux/" \
    --exclude "*~" \
	-avh --no-perms . ~

    source ~/.bashrc
}

if [ "$1" == "--force" ]
then
    copyfiles
else
    read -p "This may overwrite existing files. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
	copyfiles
	
    fi
fi

unset copyfiles
