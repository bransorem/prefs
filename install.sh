#!/bin/bash

if [[ "$(uname)" = "Darwin" ]]; then
  # mac
  zsh
else
  # ubuntu
  apt-get install zsh
fi

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

# install rust
# curl https://sh.rustup.rs -sSf | sh

# install gdbgui
# pip install gdbgui --upgrade


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

  ## Quicklook plugins
  brew cask install 1password     calibre                     github-desktop              \
      little-snitch               qlimagesize                 sublime-text                vcv-rack \
      adobe-creative-cloud        cleanmymac                  google-chrome               \
      macdown                     qlmarkdown                  suspicious-package          virtualbox \
      alfred                      coconutbattery              google-drive                \
      mactex                      qlprettypatch               texmaker                    virtualbox-extension-pack \
      android-platform-tools      cyberduck                   handbrake                   \
      manta                       qlstephen                   texshop                     visual-studio-code \
      atom                        discord                     hex-fiend                   \
      master-password             quicklook-csv               the-unarchiver              vivaldi \
      bartender                   docker                      hyper                       \
      namechanger                 quicklook-json              transmission                vlc \
      bettertouchtool             dropbox                     imageoptim                  \
      origami-studio              sequel-pro                  transmit                    wacom-intuos-tablet \
      betterzipql                 etcher                      java                        \
      postman                     sketch                      tunnelblick                 webpquicklook \
      brave                       firefox                     keybase                     \
      qlcolorcode                 steam                       vagrant                     wireshark

  ## Brews
  brew install adns direnv gcc gnupg imagemagick libffi libtasn1 luajit \
      node pcre sqlite xz awscli dnscrypt-proxy gdb gnutls isl libgcrypt libtiff \
      mariadb npth pinentry ssdeep youtube-dl boost dnsmasq gdbm go jpeg \
      libgpg-error libtool mcrypt numpy pkg-config tree zmap c-ares dnstwist \
      geoip highlight json-c libksba libunistring mhash opencv python watchman \
      cmake eigen gettext htop lame libmpc libusb minisign openexr python3 wget \
      curl fd git httpie ldns libpng libyaml mpfr openssl readline wireshark daq \
      ffmpeg glib icu4c libassuan libsodium llvm netcat redis x264 dbus \
      freetype gmp ilmbase libdnet libssh2 lua nettle p11-kit snort xvid

  # brew cleanup
  brew cleanup
  brew cask cleanup

  # hyperterm prefs
  ln -s $PREFS/hyperterm.js $HOME/.hyperterm.js
else
  # linux
  # https://blog.microideation.com/2016/08/30/customizing-ubuntu-system/
  add-apt-repository ppa:ricotz/docky
  add-apt-repository ppa:synapse-core/ppa
  apt-add-repository ppa:numix/ppa
  add-apt-repository ppa:tualatrix/ppa
  add-apt-repository ppa:noobslab/themes
  add-apt-repository ppa:shutter/ppa
  add-apt-repository ppa:webupd8team/atom

  apt-get update
  apt-get install conky docky synapse
  apt-get install numix-icon-theme numix-icon-theme-circle
  apt-get install ubuntu-tweak
  apt-get install mbuntu-y-ithemes-v4
  apt-get install nemo shutter atom

  ## NVM
  curl https://raw.github.com/creationix/nvm/master/install.sh | sh
fi

source $HOME/.zpreztorc
