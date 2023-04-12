{ config, pkgs, lib, ... }:

let 
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
in
{
  nixpkgs.config.allowUnfree = true;
  
  home = {
    username = "teto";
    homeDirectory = "/home/teto";

    packages = with pkgs; [
      unstable.neovim discord neofetch unstable.jetbrains.idea-ultimate unstable.jetbrains.rider bintools scrot spotify geoclue2 man-pages man-pages-posix gdb gnumake feh unstable.dotnet-sdk_7 coursier jetbrains.jdk zathura

      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
  };

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };

  xsession.windowManager.i3 = import ./home/i3.nix { inherit pkgs lib; };

  programs.alacritty = import ./home/alacritty.nix { inherit pkgs; };
  programs.zsh = import ./home/zsh.nix { inherit pkgs lib; };

  programs.git = {
    enable = true;
    userName = "Theo Gardet";
    userEmail = "theo.gardet@epita.fr";
  };

  fonts.fontconfig.enable = true;

  services.redshift = {
    enable = true;
    provider = "geoclue2";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
