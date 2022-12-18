{ lib, config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
   username = "teto";
   homeDirectory = "/home/teto";

  # Packages that should be installed to the user profile
   packages = with pkgs; [ 
    scrot rofi picom spotify-tui cabal-install ghc haskell-language-server geoclue2 zsh-powerlevel10k spotify discord unstable.neovim ccls man-pages man-pages-posix lua neofetch mpd polybar gcc gdb gnumake xsel feh file jetbrains.rider unstable.dotnet-sdk_7 obs-studio
  ];
 
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
  };

  programs.git = {
    enable = true;
    userName = "Theo Gardet";
    userEmail = "theo.gardet@epita.fr";
  };

  programs.alacritty = {
    enable = true;
    
    settings = {
        window = {
            opacity = 0.65;
            padding = {
                x = 10;
                y = 10;
            };
        };

        colors = {
            primary = {
                background = "0x181818";
                foreground = "0xe4e4ef";
            };
            cursor = {
                text   = "0x000000";
                cursor = "0xe4e4ef";
            };
            normal = {
                black   = "0x0D0D0D";
                red     = "0xFF301B";
                green   = "0xA0E521";
                yellow  = "0xFFC620";
                blue    = "0x1BA6FA";
                magenta = "0x8763B8";
                cyan    = "0x21DEEF";
                white   = "0xEBEBEB";
            };
            bright = {
                black   = "0x6D7070";
                red     = "0xFF4352";
                green   = "0xB8E466";
                yellow  = "0xFFD750";
                blue    = "0x1BA6FA";
                magenta = "0xA578EA";
                cyan    = "0x73FBF1";
                white   = "0xFEFEF8";
            };
        };
    };
  };

  programs.zsh = {
    enable = true; 
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
      }
    ];

    enableAutosuggestions = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
    };
  };

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.cboxusers.members = [ "teto" ];

  services = {
    redshift = {
      enable = true;
      provider = "manual";
      latitude = "48.7";
      longitude = "2.3";
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
