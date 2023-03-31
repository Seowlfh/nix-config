#! /bin/sh
# Configuration
mv configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch

# Home Manager
mv home_manager/nixpkgs/home.nix ~/.config/nixpkgs/home.nix
mv home_manager/nixpgs/p10k-config ~/.config/nixpkgs/p10k-config
# mv home_manager/nixpkgs/result ~/.config/nixpkgs/result ?
home-manager switch

# Polybar
mv home_manager/polybar ~/.config/polybar
mv home_manager/polybar-themes ~/.config/polybar-themes

