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

      #bars = [
      #  {
      #    position = "bottom";
      #    statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${./i3status-rust.toml}";
      #  }
      #];

      startup = [
        {
            command = "setxkbmap -option caps:swapescape";
            always = true;
        }
        {
            command = "${pkgs.feh}/bin/feh --bg-scale wallpaper.png";
            always = true;
        }
      ];
    };
}
