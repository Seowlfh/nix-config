# My NixOs configuration

My NixOs configuration ! For now, as I'm getting to know NixOs, it's just a dumb configuration.nix file, with home manager.

## Installation

First, you'll need to install [Home Manager](https://github.com/nix-community/home-manager) **as a Module** for NixOS. You can do this by following [this procedure](https://nix-community.github.io/home-manager/index.html#sec-install-nixos-module). Note, you only have to do the channel commands, as I already imported the module in my `configuration.nix`

Then, put this `configuration.nix` in your `/etc/nixos` folder, and then run a `sudo nixos-rebuild switch` (I believe).

Aaaand you're done !
