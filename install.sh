#!/bin/bash
CODEDIR=code

# install prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# get prefs
mkdir $HOME/$CODEDIR && cd $HOME/$CODEDIR
curl -Lk https://github.com/bransorem/prefs/archive/master.zip > prefs.zip
unzip -a prefs.zip && rm -f prefs.zip
cd prefs

## Copy Zsh settings
ln -s $HOME/code/prefs/zsh/zpreztorc $HOME/.zpreztorc
ln -s $HOME/code/prefs/zsh/zprofile $HOME/.zprofile

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
  brew cask install 1password adobe-creative-cloud alfred atom \
      bettertouchtool bartender calibre cleanmymac cyberduck \
      discord dropbox duet firefox github-desktop gitkraken google-chrome \
      handbrake hyperterm imageoptim jump-desktop little-snitch lumen \
      macdown macpaw-gemini namechanger private-internet-access proxpn \
      sketch skitch techstoreclub-simple-comic transmission the-unarchiver \
      unrarx vagrant virtualbox vivaldi vlc

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
  ln -s $HOME/code/prefs/hyperterm.js $HOME/.hyperterm.js
else
  # linux
  apt-get update
fi

## NVM
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

source $HOME/.zpreztorc
