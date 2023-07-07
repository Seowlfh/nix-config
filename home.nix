{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
in
{
  # imports = [
  #   import ./home/email.nix
  # ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "teto";
    homeDirectory = "/home/teto";

    packages = with pkgs; [
      unstable.neovim discord neofetch unstable.jetbrains.idea-ultimate unstable.jetbrains.rider bintools scrot spotify man-pages man-pages-posix gdb gnumake feh unstable.dotnet-sdk_7 zathura latexrun xdotool pstree texlive.combined.scheme-full htop thunderbird unzip tree yarn hugo vscode-fhs nodejs tmux cmake valgrind python310 postman anki libreoffice file bat direnv xsel graphviz chromium electron slack

      (nerdfonts.override { fonts = [ "FiraCode" ]; })

      # Neovim's dep
      ripgrep
      clang-tools
      bear

      # C programming
      criterion

      # Haskell programming
      unstable.ghc
      cabal-install
      stack

      # LRE
      coursier
      jdk17_headless
      gnuplot
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

  # Compositor
  services.picom.enable = true;

  # Email configuration
  # programs.mbsync.enable = true;
  # programs.msmtp.enable = true;
  # programs.notmuch = {
  #   enable = true;
  #   hooks = {
  #       preNew = "mbsync --all";
  #   };
  # };
  #
  # accounts.email.accounts = {
  #     outlook = {
  #         address = "theo.gardet@epita.fr";
  #         userName = "theo.gardet@epita.fr";
  #         realName = "Théo Gardet";
  #         mbsync =  {
  #             enable = true;
  #             create = "maildir";
  #         };
  #
  #         msmtp.enable = true;
  #         notmuch.enable = true;
  #
  #         primary = true;
  #         signature = {
  #             delimiter = "-- ";
  #             text = ''
  #                 Théo Gardet
  #                 ING1 2025 - LRE - ACDC
  #                 '';
  #             showSignature = "append";
  #         };
  #
  #         passwordCommand = "babobu";
  #
  #         flavor = "outlook.office365.com";
  #     };
  #
  #     gmail_prologin = {
  #         address = "theo.gardet@prologin.fr";
  #         userName = "theo.gardet@prologin.fr";
  #         realName = "Théo Gardet";
  #         mbsync =  {
  #             enable = true;
  #             create = "maildir";
  #         };
  #
  #         msmtp.enable = true;
  #         notmuch.enable = true;
  #
  #         primary = false;
  #         signature = {
  #             delimiter = "-- ";
  #             text = ''
  #                 Théo Gardet
  #                 ING1 2025 - LRE - ACDC
  #                 '';
  #             showSignature = "append";
  #         };
  #
  #         passwordCommand = "babobu";
  #
  #         flavor = "gmail.com";
  #     };
  # };

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
