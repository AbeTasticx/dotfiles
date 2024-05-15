# Check if script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run with sudo. Exiting."
    exit 1
fi

# Update package repositories
apt update

# Upgrade installed packages
apt upgrade -y

# Install curl
apt install curl -y

# Install Git
apt install git -y
git config --global init.defaultBranch main

# Install Zsh
apt install zsh -y

# Change the default shell to Zsh for the current user
chsh -s $(which zsh)

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Setup Pyenv
curl https://pyenv.run | bash

apt update 
apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

# Install Python versions
pyenv install 3.10
pyenv install 3.11
pyenv install 3.12

# Install .NET 8
apt-get update 
apt-get install -y dotnet-sdk-8.0

apt-get install -y aspnetcore-runtime-8.0

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install latest

# Create symbolic links
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# Create ~/.config directory if it doesn't exist
mkdir -p ~/.config

# Create symbolic link for starship.toml
ln -sf ~/.dotfiles/starship.toml ~/.config/starship.toml

# Install Docker
apt-get update
apt-get install ca-certificates -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
   tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Display completion message
echo -e "\e[32mDotfiles installation completed.\e[0m"
echo "Please restart your terminal to apply changes."
