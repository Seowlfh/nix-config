{ pkgs , lib , ... }:

{
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

  initExtra = "source ~/.config/nixpkgs/home/p10k-config/p10k.zsh";
}
