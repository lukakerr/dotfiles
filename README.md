# dotfiles

Run `./setup.sh` to setup.

You will be able to choose what to install through `y/n` prompts.

### iTerm 2

For iTerm2 configuration, under Preferences -> General, check "Load preferences from a custom folder or URL", and set the folder to ~/Library/Application Support/iTerm.

If this folder doesn't exist, create it and run `./setup.sh` again.

### Environment variables

If you have environment variables you want to use, such as a database password, create a `.secrets` file inside `dotfiles/` and export these variables.

When you run `./setup.sh`, the `.secrets` file will be sourced, and the environment variables will be available.

#### Current Setup:

<div style="text-align:center">
  <img src="https://i.imgur.com/uMEr4Cv.jpg">
</div>

