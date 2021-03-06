#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

function copyfiles() {
    rsync --exclude ".git/"        \
	--exclude ".DS_Store"    \
	--exclude "*~" \
	--exclude "bootstrap.sh" \
	--exclude "README.md"    \
	--exclude "configs/"     \
	--exclude "junk/"        \
        --exclude "setup_osx.sh" \
	-avh --no-perms . ~

    source ~/.bash_profile
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
