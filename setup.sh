# Update package repositories
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Install curl
sudo apt install curl -y

# Install Git
sudo apt install git -y
git config --global init.defaultBranch main

# Install Zsh
sudo apt install zsh -y


# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Setup Pyenv
curl https://pyenv.run | bash

sudo apt update 
sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y


# Install .NET 8
sudo apt-get update 
sudo apt-get install -y dotnet-sdk-8.0

sudo apt-get install -y aspnetcore-runtime-8.0

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Create symbolic links
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# Create ~/.config directory if it doesn't exist
mkdir -p ~/.config

# Create symbolic link for starship.toml
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml

# Install Docker
sudo apt-get update
sudo apt-get install ca-certificates -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Switch to zsh
zsh

# source ZSHRC
source ~/.zshrc

# Change the default shell to Zsh for the current user
chsh -s $(which zsh)

# Install Python versions
pyenv install 3.10
pyenv install 3.11
pyenv install 3.12

# Install latest NODE version
nvm install latest

# Display completion message
echo -e "\e[32mDotfiles installation completed.\e[0m"
echo "Please restart your terminal to apply changes."
