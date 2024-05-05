{ pkgs, ... }:

{
  home.packages = with pkgs; [ fish ];

  programs.fish = {
    enable = true;
    # TODO: fish config https://nixos.wiki/wiki/Fish
  };
}
