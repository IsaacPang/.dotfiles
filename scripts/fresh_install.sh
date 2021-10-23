#!/bin/sh
# assumes installation of ubuntu > 18.04LTS and snap compatible
# change the file to executable and run the file as root
# sudo chmod +x new_install.sh
# sudo ./new_install.sh

# upgrades
apt update
apt upgrade -y

# install git
apt install git

# # Set up ssh
# ssh-keygen -t ed25519 -C "your.email@example.com"
# eval `ssh-agent -s`
# ssh-add ~/.ssh/id_ed25519
# cat ~/.ssh/id_ed25519.pub | xclip -sel clip

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

# ranger configs
ranger --copy-config=all

# updating rofi UI $ rofi-theme-selector

# install across linux using snap
snap install --classic code
snap install chromium
snap install fromscratch

# installing neovim nightly version, using fuse
wget -r https://github.com/neovim/neovim/releases/download/stable/nvim.appimage \
    -O $HOME/Downloads/nvim
chmod u+x $HOME/Downloads/nvim
mv $HOME/Downloads/nvim /usr/bin/

# installing vimplug
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --user neovim
# run :PlugInstall in neovim

# installing fira code nerd font
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
