{ pkgs , lib, ... }:

let
  mod = "Mod4";
in
{
    enable = true;
    config = {
      modifier = mod;

      menu = "${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";
      # terminal = "${pkgs.alacritty}/bin/alacritty";
      terminal = "${pkgs.kitty}/bin/kitty";

      bars = [];

      startup = [
        {
            command = "i3-msg workspace 1";
            always = true;
        }
        {
            command = "systemctl --user restart polybar";
            always = true;
        }
        {
            command = "betterlockscreen -u ~/.config/home-manager/home/lockscreen.jpg";
            always = true;
        }
      ];

      gaps = {
	inner = 10;
	smartBorders = "on";
      };

      window.titlebar = false;

      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+m" = "exec ${pkgs.firefox}/bin/firefox";
        "${mod}+Shift+b" = "exec systemctl poweroff";
        "${mod}+Shift+r" = "exec systemctl restart";
        "${mod}+Shift+x" = "exec betterlockscreen -l";
        "--release ${mod}+Shift+s" = "exec scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
        "${mod}+Shift+f" = "exec scrot '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
      };

      # This is not yet working
      # colors = let
      #   dark-green = "#009026";
      #   green = "#00d422";
      # in {
      #   background = "#000000";
      #
      #   focused = {
      #       border = dark-green;
      #       background = "#285577";
      #       text = "#ffffff";
      #       indicator = dark-green;
      #       childBorder = "#285577";
      #   };
      #   focusedInactive = {
      #       border = green;
      #       background = "#5f676a";
      #       text = "#ffffff";
      #       indicator = green;
      #       childBorder = "#5f676a";
      #   };
      #   unfocused = {
      #       border = green;
      #       background = "#222222";
      #       text = "#888888";
      #       indicator = green;
      #       childBorder = "#222222";
      #   };
      #   urgent = {
      #       border = green;
      #       background = "#900000";
      #       text = "#ffffff";
      #       indicator = dark-green;
      #       childBorder = "#900000";
      #   };
      #   placeholder = {
      #       border = green;
      #       background = "#0c0c0c";
      #       text = "#ffffff";
      #       indicator = green;
      #       childBorder = "#0c0c0c";
      #   };
      # };
    };

    extraConfig = "exec --no-startup-id feh --bg-scale ~/.config/home-manager/home/wallpaper.jpg";
}
