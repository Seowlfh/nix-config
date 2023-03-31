#! /bin/sh

# Copy configuration.nix
cp /etc/nixos/configuration.nix .

# Home Manager
cp ~/.config/nixpkgs/home.nix home_manager/nixpkgs

# P10k Config
cp -r ~/.config/nixpkgs/p10k-config/ home_manager/nixpkgs
cp -r ~/.config/nixpkgs/result/ home_manager/nixpkgs

# Polybar
cp -r ~/.config/polybar home_manager
cp -r ~/.config/polybar-themes home_manager

# i3
cp ~/.config/i3/config i3
cp ~/.config/i3/wallpaper.jpg i3
