#!/bin/bash

dir="$(pwd)"
files=".bash_profile .config/nvim .gitconfig .hushlogin .inputrc .railsrc .vim .vimrc"

cd $dir

for file in $files; do
  echo "Linking $dir/$file to $file."
  ln -sf $dir/$file ~/$file
done

# Secret env variables
if [ -f .secrets ]; then
  ln -sf $dir/".secrets" ~/".secrets"
fi

source ~/.bash_profile