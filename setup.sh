#!/bin/bash

dir="$(pwd)"
files=".bash_profile .config/nvim .hushlogin .inputrc .railsrc .vim .vimrc .functions .aliases .spacemacs"
binaries="colortest"

cd $dir

for file in $files; do
  echo "Linking $dir/$file to $file."
  ln -sf $dir/$file ~/$file
done

# iterm install
printf "\n"
read -p "Install iTerm2 theme? [y/n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  printf "\n"
  echo "Copying iterm config"
  printf "\n"
  cp $dir/iterm/com.googlecode.iterm2.plist ${HOME}/Library/Application\ Support/iTerm
else
  printf "\n"
fi

# Secret env variables
if [ -f .secrets ]; then
  ln -sf $dir/".secrets" ~/".secrets"
fi

if [ -f .gitconfig ]; then
  ln -sf $dir/".gitconfig" ~/".gitconfig"
fi

# brew install
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

# macos configure.sh
if [ "$(uname)" == "Darwin" ]; then
  printf "\n"
  read -p "Set macOS defaults from macos/configure.sh? [y/n]: " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    printf "\n"
    echo "Setting defaults, some programs (Finder, Dock etc) may restart on completion"
    printf "\n"
    sh ./macos/configure.sh
  else
    printf "\n"
  fi
fi

# bin install
printf "\n"
read -p "Install binaries to /usr/local/bin? [y/n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  printf "\n"
  echo "Installing binaries"
  printf "\n"
  for bin in $binaries; do
    echo "Linking $dir/bin/$bin to /usr/local/bin/$bin."
    ln -sf $dir/bin/$bin /usr/local/bin/$bin
  done
else
  printf "\n"
fi

source ~/.bash_profile