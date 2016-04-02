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

## Taps

    $ brew tap homebrew/services

## Casks

```
$ brew cask install atom cyberduck imageoptim github-desktop firefox macdown namechanger vagrant virtualbox vlc skitch dropbox bartender calibre duet evernote macpaw-gemini jump-desktop iterm2 little-snitch proxpn  techstoreclub-simple-comic sketch transmission unrarx the-unarchiver google-chrome alfred qlmarkdown 1password
$ brew cask cleanup
```

## Brews

```
$ brew install boost cmake curl docker elasticsearch git go httpie imagemagick libssh2 libyaml mcrypt mongodb openssl pkg-config rbenv redis rethinkdb sqlite wget
$ brew cleanup
```

## OpenCV

```
$ brew tap homebrew/science
$ brew install opencv
$ brew cleanup
```
