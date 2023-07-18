{ pkgs, ...}:
{
  enable = true;

  font = {
    name = "FiraCode Nerd Font";
    size = 15.3;
  };

  settings = {
    color16 = "#282c34";

    background_opacity = "0.8";

    placement_strategy = "top-left";

    enable_audio_bell = "no";

    window_margin_width = "5.0";
    window_padding_width = "5.0";

    resize_in_steps = "yes";

    dynamic_background_opacity = "yes";

    # Crazy shenanigans to dynamically change the padding with neovim
    allow_remote_control = "yes";
    enabled_layouts = "tall";

    listen_on = "unix:/tmp/mykitty";

  };
}






