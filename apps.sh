#!/bin/bash


## after install, upgrade

sudo apt update -y && sudo apt-get upgrade -y


sudo apt install -y apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y

sudo apt install -y brave-browser

## vim

sudo apt-get install -y neovim

## ulauncher

sudo add-apt-repository -y ppa:agornostal/ulauncher && sudo apt update -y && sudo apt install -y ulauncher

## oh myzsh

sudo apt-get install -y zsh && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## vscode

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

sudo apt update -y

sudo apt install -y code # or code-insiders

## obs studio

sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt update -y
sudo apt install -y obs-studio


## docker

 sudo apt-get update -y
 sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 sudo apt-get update -y
 sudo apt-get install -y docker-ce docker-ce-cli containerd.io

 ## docker compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


 # refs https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket
sudo usermod -aG docker ${USER}

## spotify

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y && sudo apt-get install -y spotify-client


## nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

zsh 

nvm install 14
nvm install 16

nvm alias default 16

## tmux

sudo apt install -y tmux

current=$(pwd)
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cd $current

## slack

wget https://downloads.slack-edge.com/releases/linux/4.23.0/prod/x64/slack-desktop-4.23.0-amd64.deb
(sudo dpkg -i slack-desktop-4.23.0-amd64.deb || true)
sudo apt-get install -f
rm slack-desktop-4.23.0-amd64.deb