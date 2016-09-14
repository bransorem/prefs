#!/bin/bash

# install prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

CODEDIR=code

# get prefs
cd $HOME
mkdir $CODEDIR
cd $CODEDIR
curl -Lk https://github.com/bransorem/prefs/archive/master.zip > prefs.zip
unzip -o -a prefs.zip
rm -f prefs.zip
mv prefs-master prefs
cd prefs

PREFS=$HOME/$CODEDIR/prefs

## Copy Zsh settings
ln -s $PREFS/zsh/zpreztorc $HOME/.zpreztorc
ln -s $PREFS/zsh/zprofile $HOME/.zprofile

## MAC
if [[ "$(uname)" = "Darwin" ]]; then
  ## Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  ## Brew Cask
  brew install caskroom/cask/brew-cask
  ## Taps
  brew tap homebrew/services
  brew tap homebrew/science

  ## Casks
  brew cask install 1password \
      adobe-creative-cloud alfred atom \
      bettertouchtool bartender \
      calibre cleanmymac cyberduck \
      discord dropbox duet \
      firefox \
      gemini github-desktop gitkraken google-chrome \
      handbrake hyperterm \
      imageoptim \
      jump-desktop \
      little-snitch lumen \
      macdown \
      namechanger \
      sketch skitch \
      techstoreclub-simple-comic transmission tunnelblick the-unarchiver \
      unrarx \
      vagrant virtualbox vivaldi vlc

  ## Quicklook plugins
  brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
      qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook \
      suspicious-package

  ## Brews
  brew install boost cmake curl docker elasticsearch git go httpie \
      imagemagick keybase libssh2 libyaml mcrypt mongodb numpy opencv \
      openssl pkg-config rbenv redis rethinkdb sqlite wget

  # brew cleanup
  brew cleanup
  brew cask cleanup

  # hyperterm prefs
  ln -s $PREFS/hyperterm.js $HOME/.hyperterm.js
else
  # linux
  apt-get update
fi

## NVM
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

source $HOME/.zpreztorc
