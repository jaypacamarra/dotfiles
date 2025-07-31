#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install X11 and i3 and curl, and others
sudo apt install -y xorg i3 curl \
	lightdm kitty polybar firefox zoxide \
	zsh stow fzf xclip tmux rofi

# Enable lightdm
sudo systemctl enable lightdm

# Install vim plug
 ~/.vim/autoload/plug.vim --create-dirs \
	     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# reboot sudo reboot
echo "Setup complete, reboot system with:"
echo "sudo reboot"
