{ pkgs , ... }:

{
  enable = true;

  settings = {
    window = {
      opacity = 0.9;

      dimensions = {
        lines = 40;
        columns = 125;
      };

      font = {
        normal.family = "FiraCode Nerd Font Mono";
        bold.family = "FiraCode Nerd Font Mono";
        italic.family = "FiraCode Nerd Font Mono";
        size = 12.0;
      };
    };
  };
}
