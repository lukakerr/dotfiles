if test ! $(which brew); then
  echo "Installing brew..."
  # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

printf "\n"
echo "Updating brew..."
brew update

PACKAGES=(
  elasticsearch
  ffmpeg
  freetype
  gdbm
  geckodriver
  gettext
  git-flow-avh
  gnu-getopt
  icu4c
  imagemagick
  jemalloc
  jpeg
  kibana
  lame
  libevent
  libpng
  libtermkey
  libtiff
  libtool
  libuv
  libvterm
  libxml2
  libyaml
  little-cms2
  mongodb
  msgpack
  neovim
  node
  openssl
  openssl@1.1
  pcre
  php71
  phpmyadmin
  pkg-config
  postgresql
  python
  python3
  qt
  qt5
  readline
  redis
  ruby
  s3cmd
  sip
  sqlite
  unibilium
  unixodbc
  watchman
  wget
  wxmac
  wxpython
  x264
  xvid
  xz
  zsh
)

printf "\n"
echo "Installing packages..."
brew install ${PACKAGES[@]}

printf "\n"
echo "Cleaning up..."
brew cleanup