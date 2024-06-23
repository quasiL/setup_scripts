#!/bin/bash

# Install packages
install_package() {
    sudo apt install -y "$1"
    echo "$1 installed successfully."
}

# Download and install Telegram
install_telegram() {
    echo "Downloading Telegram..."
    wget "https://telegram.org/dl/desktop/linux" -O telegram.tar.xz

    echo "Extracting Telegram..."
    tar -xvf telegram.tar.xz

    echo "Moving Telegram to /opt..."
    sudo mv Telegram /opt/

    echo "Creating a symbolic link for Telegram..."
    sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram

    echo "Cleaning up..."
    rm telegram.tar.xz

    echo "Telegram installed successfully."
}

# Download and install Discord
install_discord() {
    echo "Downloading Discord..."
    wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb

    echo "Installing Discord..."
    sudo apt install ./discord.deb

    echo "Cleaning up..."
    rm discord.deb

    echo "Discord installed successfully."
}

install_joplin() {
    echo "Installing Joplin..."
    # GUI for Joplin
    wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
    # CLI for Joplin
    npm install -g joplin
}

sudo apt update

install_telegram
install_discord
install_joplin

install_package firefox
install_package keepassxc
# recommended for keepassxc
install_package xdotool
# screenshot tool
install_package flameshot
install_package git

# cat with syntax highlighting
install_package bat
# test internet speed
install_package speedtest-cli

sudo apt update

#sudo apt install php8.2-{cli,fpm,curl,mysqlnd,gd,opcache,zip,intl,common,bcmath,imagick,xmlrpc,readline,memcached,redis,mbstring,apcu,xml,dom,memcache}