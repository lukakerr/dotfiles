#!/bin/bash

dir="$(pwd)"
files=".bash_profile .config/nvim .hushlogin .inputrc .railsrc .vim .vimrc .functions .aliases .spacemacs"

cd $dir

for file in $files; do
  echo "Linking $dir/$file to $file."
  ln -sf $dir/$file ~/$file
done

echo "Copying iterm config"
cp $dir/iterm/com.googlecode.iterm2.plist ${HOME}/Library/Application\ Support/iTerm

# Secret env variables
if [ -f .secrets ]; then
  ln -sf $dir/".secrets" ~/".secrets"
fi

if [ -f .gitconfig ]; then
  ln -sf $dir/".gitconfig" ~/".gitconfig"
fi

# Brew install
printf "\n"
read -p "Install all brew packages? [y/n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  printf "\n\n"
  echo "Installing packages with brew"
  echo "This may take a while"
  printf "\n"
  sh ./brew/install.sh
  printf "\n"
  echo "Done!"
else
  printf "\n"
fi

source ~/.bash_profile