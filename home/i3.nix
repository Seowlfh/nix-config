{ pkgs , lib, ... }:

let
  mod = "Mod4";
  dark-green = "#009026";
  green = "#00d422";
in
{
    enable = true;
    config = {
      modifier = mod;

      menu = "${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";
      terminal = "${pkgs.kitty}/bin/kitty";

      bars = [];

      startup = [
        {
            command = "feh --bg-scale ~/.config/home-manager/home/wallpaper.jpg" ;
            always = true;
        }
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
      };

      window = {
        titlebar = false;
        border = 0;
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+m" = "exec ${pkgs.firefox}/bin/firefox";
        "${mod}+Shift+b" = "exec systemctl poweroff";
        "${mod}+Shift+r" = "exec systemctl reboot";
        "${mod}+Shift+x" = "exec betterlockscreen -l";
        "--release ${mod}+Shift+s" = "exec scrot -s '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
        "${mod}+Shift+f" = "exec scrot '/tmp/%F_%T_$wx$h.png' -e 'xclip -selection clipboard -target image/png -i $f'";
      };

      colors = {
        background = "#000000";

        focused = {
            border = green;
            background = "#285577";
            text = "#ffffff";
            indicator = green;
            childBorder = green;
        };
        focusedInactive = {
            border = dark-green;
            background = "#5f676a";
            text = "#ffffff";
            indicator = dark-green;
            childBorder = dark-green;
        };
        unfocused = {
            border = dark-green;
            background = "#222222";
            text = "#888888";
            indicator = dark-green;
            childBorder = dark-green;
        };
        urgent = {
            border = green;
            background = "#900000";
            text = "#ffffff";
            indicator = green;
            childBorder = green;
        };
        placeholder = {
            border = dark-green;
            background = "#0c0c0c";
            text = "#ffffff";
            indicator = dark-green;
            childBorder = dark-green;
        };
      };
    };
}
