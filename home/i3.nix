{ pkgs , lib, ... }:

let
  mod = "Mod4";
in
{
    enable = true;
    config = {
      modifier = mod;

      menu = "${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";
      terminal = "${pkgs.kitty}/bin/kitty tmux a";

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
    };
}
