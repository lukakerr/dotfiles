# dotfiles

Run `./setup.sh` to setup.

### iTerm 2

For iTerm2 configuration, under Preferences -> General, check "Load preferences from a custom folder or URL", and set the folder to ~/Library/Application Support/iTerm.

If this folder doesn't exist, create it and run `./setup.sh` again.

In iTerm2 preferences there should be a `Default` profile and a `Lighter` profile. These are displayed in the images below.

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

#### Spacemacs

<div style="text-align:center">
  <img src="https://i.imgur.com/sz4Mvvb.png">
</div>