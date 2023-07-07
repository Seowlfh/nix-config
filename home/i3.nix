{ pkgs , lib, ... }:

let
  mod = "Mod4";
in
{
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault {
        "${mod}+Return"= "exec ${pkgs.alacritty}/bin/alacritty";
      };

      startup = [
        {
            command = "setxkbmap -option caps:swapescape";
            always = true;
        }
        {
            command = "i3-msg workspace 1";
            always = true;
        }
      ];
    };

    extraConfig = "exec feh --no-startup-id --bg-scale ~/.config/nixpkgs/home/wallpaper.jpg";
}
