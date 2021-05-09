#!/bin/bash

# bashrc

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH:/usr/local/cuda-11.3/bin";

# Load the shell dotfiles, and then some:
for file in ~/.{bash_prompt,functions}
do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# exports

# Make emacs the default editor.
export EDITOR='emacs -nw'

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth'

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}"

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# aliases

# Shortcuts
alias apps="cd ~/Applications"
alias dropbox="cd ~/Cloud/Dropbox"
alias downloads="cd ~/Downloads"
alias desktop="cd ~/Desktop"
alias docs="cd ~/Documents"

# Useful size commands
# alias dirsize="find -maxdepth 1 -type d -name '[!.]*' -exec du -sh {} + | sort -hr"
alias dirsize="du -hxs ./* | sort -rh"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1
then 
    colorflag="--color"
else 
    colorflag="-G"
fi

# List all files colorized in long format
alias ls="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Delete emacs backup files
alias del="rm -rf \#* *~"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vasu/Applications/anaconda/bin/conda' 'shell.bash' 'hook
' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vasu/Applications/anaconda/etc/profile.d/conda.sh" ]; then
        . "/home/vasu/Applications/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/vasu/Applications/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
