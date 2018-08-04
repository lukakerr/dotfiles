#! /bin/zsh

# Needs https://github.com/base16-builder/base16-builder to be installed

output_names=("vim" "iterm2")

typeset -A outputs

outputs[vim]="vimrc"
outputs[iterm2]="itermcolors"

themes_dir="$(pwd)/themes"

# Iterate over given themes
for theme in "$@"
do
  for output in "${output_names[@]}"
  do
    light_dir="$themes_dir/$output"
    dark_dir="$themes_dir/$output"

    mkdir -p $light_dir
    mkdir -p $dark_dir

    light_file="$light_dir/$theme-light.${outputs[$output]}"
    dark_file="$dark_dir/$theme-dark.${outputs[$output]}"

    base16-builder -s $theme -t $output -b light > $light_file
    base16-builder -s $theme -t $output -b dark > $dark_file
  done
done

# For custom themes
for theme in "$@"
do
  light_dir="$themes_dir/alacritty"
  dark_dir="$themes_dir/alacritty"

  mkdir -p $light_dir
  mkdir -p $dark_dir

  light_file="$light_dir/$theme-light.yml"
  dark_file="$dark_dir/$theme-dark.yml"

  base16-builder -s $theme -t "./base16/templates/alacritty/light.ejs" -b light > $light_file
  base16-builder -s $theme -t "./base16/templates/alacritty/dark.ejs" -b dark > $dark_file
done

ln -sf $themes_dir ~/.themes
