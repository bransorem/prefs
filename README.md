# Installation

    curl -s https://raw.githubusercontent.com/bransorem/prefs/master/install.sh | sh


# Manual Installation

## Prezto

[Installation Instructions](https://github.com/sorin-ionescu/prezto)

```
$ zsh
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
$ chsh -s /bin/zsh
```

## Get this repo

    $ mkdir code && cd code
    $ curl -Lk https://github.com/bransorem/prefs/archive/master.zip > prefs.zip
    $ unzip -a prefs.zip && rm -f prefs.zip
    $ cd prefs

## Copy Zsh settings

    $ ln -s ~/code/prefs/zsh/zpreztorc ~/.zpreztorc
    $ ln -s ~/code/prefs/zsh/zprofile ~/.zprofile

## Homebrew

    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Brew Cask

    $ brew install caskroom/cask/brew-cask

## NVM

    $ curl https://raw.github.com/creationix/nvm/master/install.sh | sh

## [OPTIONAL] Set NPM init script:

Create GitHub [access token](https://github.com/settings/tokens).

Add token to Keychain Access (name it 'npm-init').

    $ npm config set init-module ~/code/prefs/node/npm-init.js

## Taps

    $ brew tap homebrew/services

## Casks

```
$ brew cask install 1password \
    adobe-creative-cloud alfred atom \
    bettertouchtool bartender brave \
    calibre cleanmymac \
    discord dropbox \
    github-desktop google-chrome \
    handbrake hyper \
    java java7 \
    keybase \
    little-snitch \
    master-password \
    n namechanger \
    transmission tunnelblick the-unarchiver \
    vagrant virtualbox vivaldi vlc
$ brew cask cleanup
```

## App Store

- Parcel
- Paste

## Quicklook plugins

```
$ brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json \
    qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook \
    suspicious-package
```

## Brews

```
$ brew install boost cmake curl dnscrypt-proxy elasticsearch ffmpeg gcc gdb gdbm git go gnutls httpie \
    imagemagick keybase libssh2 libyaml mcrypt mariadb mcrypt mhash numpy opencv \
    openssl python python3 pkg-config redis sqlite tree wget wireshark youtube-dl
$ brew cleanup
```

## OpenCV

```
$ brew tap homebrew/science
$ brew install opencv
$ brew cleanup
```

## Atom Plugins

```
atom-beautify
color-picker
emmet
highlight-line
linter
linter-eslint
minimap
pigments
tabs-to-spaces
tool-bar
tool-bar-main
simple-drag-drop-text
docblockr
auto-update-packages
file-icons
```
