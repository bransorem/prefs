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

  ## Casks
  brew cask install atom cyberduck imageoptim github-desktop firefox macdown namechanger vagrant virtualbox vlc skitch dropbox bartender calibre duet evernote macpaw-gemini jump-desktop iterm2 little-snitch proxpn  techstoreclub-simple-comic sketch transmission unrarx the-unarchiver google-chrome alfred qlmarkdown 1password

  ## Brews
  brew install boost cmake curl docker elasticsearch git go httpie imagemagick libssh2 libyaml mcrypt mongodb openssl pkg-config rbenv redis rethinkdb sqlite wget

  ## OpenCV
  brew tap homebrew/science
  brew install opencv

  # brew cleanup
  brew cleanup
  brew cask cleanup

  # iterm2 prefs
  cp $HOME/code/prefs/iterm2.xml $HOME/Documents/iTerm/com.googlecode.iterm2.plist
else
  # linux
  apt-get update
fi

## NVM
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

source $HOME/.zpreztorc
