# dotfiles

Run `./setup.sh` to setup.

You will be able to choose what to install through `y/n` prompts.

### iTerm 2

For iTerm2 configuration, under Preferences -> General, check "Load preferences from a custom folder or URL", and set the folder to ~/Library/Application Support/iTerm.

If this folder doesn't exist, create it and run `./setup.sh` again.

In iTerm2 preferences there should be `Default`, `Lighter` and `Nord` profiles. These are displayed in the images below.

### Environment variables

If you have environment variables you want to use, such as a database password, create a `.secrets` file inside `dotfiles/` and export these variables.

When you run `./setup.sh`, the `.secrets` file will be sourced, and the environment variables will be available.

#### iTerm2 Default Profile

<div style="text-align:center">
	<img src="https://i.imgur.com/GUkeInO.png">
</div>

#### iTerm2 Lighter Profile

<div style="text-align:center">
  <img src="https://i.imgur.com/JN1INGV.png">
</div>

#### iTerm2 Nord Profile

<div style="text-align:center">
  <img src="https://i.imgur.com/uknpE4A.png">
</div>

#### Spacemacs (`dotspacemacs-themes '(nord)`)

<div style="text-align:center">
  <img src="https://i.imgur.com/sz4Mvvb.png">
</div>

#### Vim (`colorscheme nord`)

<div style="text-align:center">
  <img src="https://i.imgur.com/6AwricJ.png">
</div>

#### Sublime Text

I've created a custom theme for sublime text called [material-nord](https://github.com/lukakerr/material-nord).

<div style="text-align:center">
  <img src="https://i.imgur.com/0dnXiui.png">
</div>