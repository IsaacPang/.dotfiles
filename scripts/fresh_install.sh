#!/bin/sh
# assumes installation of ubuntu > 18.04LTS and snap compatible change the file to executable and run the file as root
# sudo chmod +x new_install.sh
# sudo ./new_install.sh

# upgrades
apt update
apt upgrade -y

# install git
apt install git
apt install xclip

# # Set up ssh
# ssh-keygen -t ed25519 -C "your.email@example.com"
# eval `ssh-agent -s`
# ssh-add $HOME/.ssh/id_ed25519
# cat $HOME/.ssh/id_ed25519.pub | xclip -sel clip

# update bash & aliases
touch $HOME/.bash_aliases

# # create a bare repo for dotfiles
# git init --bare $HOME/.dotfiles
# alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# config config --local status.showUntrackedFiles no
# echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash_aliases
# config remote add origin https://github.com/IsaacPang/.dotfiles.git
# config branch -M main
# config push -u origin main

# Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# pull dotfiles repo and create bare repo for home
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash_aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo ".dotfiles" >> .gitignore
git clone --bare https://github.com/IsaacPang/.dotfiles.git $HOME/.dotfiles

# install python other tooling
apt python3-pip unzip

# install terminator
apt install terminator

# customise terminator
pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME/.config/terminator/plugins/terminator-themes.py
# select terminator themes as required

# install i3 and deps
apt install ranger i3 feh fonts-font-awesome rofi \
    pulseaudio-utils xbacklight alsa-tools clipit \
    gcc git locate pcmanfm acpi libnotify-bin

add-apt-repository -y -u ppa:linuxuprising/shutter
apt install shutter

# install video camera drivers
apt install cheese
# install zoom from zoom website

# install python and neovim deps
python3 -m pip install --user --upgrade pynvim

# ranger configs
ranger --copy-config=all

# updating rofi UI $ rofi-theme-selector

# # install across linux using snap
# install vscode
snap install code --classic
# install chromium
snap install chromium
# install from stracth
snap install fromscratch
# install slack
sudo snap install slack --classic

# install fira code nerd font
wget -r https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip \
    -O $HOME/Downloads/FiraCode.zip
mkdir $HOME/.fonts
unzip $HOME/Downloads/FiraCode.zip -d $HOME/.fonts
fc-cache -fv
rm -r $HOME/Downloads/FiaCode.zip
# # check all compiled fonts
# fc-list

# # enable natural scrolling in i3
# edit /usr/share/X11/xorg.conf.d/40-libinput.conf
# # for mouse:
# # Match on all types of devices but joysticks
# Section "InputClass"
#         Identifier "libinput pointer catchall"
#         MatchIsPointer "on"
#         MatchDevicePath "/dev/input/event*"
#         Driver "libinput"
#         Option "NaturalScrolling" "True"
# EndSection
# # for touchpad:
# Section "InputClass"
#         Identifier "libinput touchpad catchall"
#         MatchIsTouchpad "on"
#         MatchDevicePath "/dev/input/event*"
#         Driver "libinput"
#         Option "NaturalScrolling" "True"
# EndSection

# install node version manager
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# install node 14 LTS (should be updated with time)
nvm install --lts
nvm install 14
nvm use 14

## Install ASP.NET Core Runtime & .NET SDK for C# development
# get microsoft trusted package signing keys
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# install latest .NET SDK
apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y dotnet-sdk-5.0

# install latest ASP.NET Core Runtime
apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -y aspnetcore-runtime-5.0

## install LTS versions
# view latest apt policy for LTS version
# apt policy dotnet-sdk-3.1
# apt-get install -y --allow-downgrades dotnet-sdk-3.1=3.1.414-1
# apt policy dotnet-sdk-2.1
# apt-get install -y --allow-downgrades dotnet-sdk-2.1=2.1.818-1


## Installation option with dotnet-install.sh
# install side-by-side .NET SDK & Core runtimes
# wget https://dot.net/v1/dotnet-install.sh -O $HOME/scripts/dotnet-install.sh
# chmod +x $HOME/scripts/dotnet-install.sh

## install compatible .NET runtime & SDKs for dotnet-try tool
# $HOME/scripts/dotnet-install.sh --channel "LTS" --install-dir "$HOME/.dotnet" --os "linux"
# $HOME/scripts/dotnet-install.sh --channel "3.0" --install-dir "$HOME/.dotnet" --os "linux"
# $HOME/scripts/dotnet-install.sh --channel "2.1" --install-dir "$HOME/.dotnet" --os "linux"

# install dotnet-try
dotnet tool install --global Microsoft.dotnet-try # --version 1.0.20474.1
# dotnet tool uninstall --global Microsoft.dotnet-try
# dotnet tool update --global Microsoft.dotnet-try

## C# Development
# use vscode to develop C# projects
# Creating console projects with C#
# dotnet new console -o <app-name>; cd <app-name>; dotnet restore; dotnet run

# Creating a MVC webapp with C#
# dotnet new mvc -au None -o <app-name>; cd <app-name>; dotnet restore; dotnet run

## Install neovim & configure. This must be done last
# install neovim nightly version, using fuse
wget -r https://github.com/neovim/neovim/releases/download/stable/nvim.appimage \
    -O $HOME/Downloads/nvim
chmod u+x $HOME/Downloads/nvim
mv $HOME/Downloads/nvim /usr/bin/

# install vimplug
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim

# run :PlugInstall in neovim syncrhonously then quit all
nvim '+PlugInstall --sync' +qa

# home Projects folder
mkdir $HOME/Projects
git clone https://github.com/dotnet/try-samples.git $HOME/Projects/try-samples

# set Nvidia X Server to prevent Scren Tearing
# Nvidia X Server in Ubuntu - Select Configuration & Advanced
# Select Force Composition Pipeline or Force Full Composition Pipeline

# remove screen lock, blanking & energy saver
xset s off
xset s noblank
xset -dpms

## install conda
# wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
# bash Mniconda3-py39_4.10.3-Linux-x86_64.sh

# symlink trash to home
ln -s ~/.local/share/Trash ~/trash
