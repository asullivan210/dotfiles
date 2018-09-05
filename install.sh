#!/bin/bash
############################

########## Variables

DOTS="$PWD"
files="git agignore gvimrc vim vimrc bash_profile"    # list of files/folders to symlink in homedir

##########

echo "Setting up your Mac..."

echo "Get brew"
# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
  echo "Creating symlink to $file in home directory."
  ln -fsv $DOTS/$file ~/.$file
done
ln -fsv $DOTS/Brewfile ~/Brewfile
