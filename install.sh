#!/bin/bash

sudo apt update
sudo apt upgrade

# CLI Tools
sudo apt install vim
sudo apt install tmux
sudo apt install meld
sudo apt install virtualenv

# Brave
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Quicktile
sudo apt-get install python3 python3-pip python3-setuptools python3-gi python3-xlib python3-dbus gir1.2-glib-2.0 gir1.2-gtk-3.0 gir1.2-wnck-3.0
sudo pip3 install https://github.com/ssokolow/quicktile/archive/master.zip

# Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Intellij
sudo add-apt-repository ppa:mmk2410/intellij-idea
sudo apt-get update
sudo apt install intellij-idea-community

# SDKMan
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.252-open
sdk install scala 2.11.12
sdk install scala 2.12.8
sdk install gradle 4.9
sdk install sbt
sdk install maven
sdk install spark 2.4.4

# Dbeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | tee /etc/apt/sources.list.d/dbeaver.list
sudo apt-get update -y
sudo apt-get install dbeaver-ce -y

# AWS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install ./slack-desktop-*.deb

# OpenVpn
sudo apt-get install openvpn
sudo apt-get install network-manager-openvpn-gnome

# Vulkan
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt update
sudo apt upgrade
sudo apt install libvulkan1 mesa-vulkan-drivers vulkan-utils

# Other Installs
# - Dash to Dock
# - Sound Input & Output Chooser
# - Radeon RX 570 Driver
# - Lastpass chrome plugin
# - Download Giteye
# 
# Credentials
# - Run `aws configure` once you get credentials
# - Import .ovpn file for VPN access
# - SSH Keygen for git remote access
# - Dbeaver credentials for databases
