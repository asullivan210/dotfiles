#!/bin/bash
############################

########## Variables

DOTS="$PWD"
files="agignore gvimrc vim vimrc bash_profile"    # list of files/folders to symlink in homedir

##########

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -fsv $DOTS/$file ~/.$file
done
