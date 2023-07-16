{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "teto";
  home.homeDirectory = "/home/teto";

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
      unstable.neovim discord neofetch unstable.jetbrains.idea-ultimate scrot spotify man-pages man-pages-posix gdb gnumake feh zathura latexrun xdotool pstree htop thunderbird unzip tree vscode-fhs tmux cmake valgrind anki libreoffice file bat xsel slack pavucontrol gcc teams

      # Neovim's dep
      ripgrep
      clang-tools
      bear

      # LRE
      coursier
      jdk17_headless
      gnuplot

      # Utils
      xclip wget

      # LSP
      cmake-language-server
  ];


  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/teto/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    # TERMINAL = "alacritty";
  };

  xsession.windowManager.i3 = import ./home/i3.nix { inherit pkgs lib; };

  # programs.alacritty = import ./home/alacritty.nix { inherit pkgs; };
  programs.kitty = import ./home/kitty.nix { inherit pkgs; };
  programs.zsh = import ./home/zsh.nix { inherit pkgs lib; };
  programs.rofi = import ./home/rofi.nix { inherit pkgs; };

  services.polybar = import ./home/polybar.nix { inherit pkgs; };
  services.betterlockscreen = import ./home/betterlockscreen.nix { inherit pkgs; };

  programs.git = {
    enable = true;
    userName = "Theo Gardet";
    userEmail = "theo.gardet@epita.fr";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Compositor
  services.picom.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
