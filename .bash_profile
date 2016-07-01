#!/bin/bash

# bash_profile

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
for file in ~/.{bash_prompt,exports,aliases,functions,extra}
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]
then
    source "$(brew --prefix)/share/bash-completion/bash_completion"
elif [ -f /etc/bash_completion ]
then
    source /etc/bash_completion
fi

# Load RVM into a shell session 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Load environment modules into a shell session
[[ -s /Applications/modules-3.2.10/Modules/3.2.10/init/bash ]] && source "$HOME/Applications/modules-3.2.10/Modules/3.2.10/init/bash"
