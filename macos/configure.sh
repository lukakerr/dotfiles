# Set macOS defaults

# disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES

# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES

# Show the ~/Library folder in finder
chflags nohidden ~/Library

# Disable autoboot
sudo nvram AutoBoot=%00

# relaunch changed programs
killall Dock
killall Finder