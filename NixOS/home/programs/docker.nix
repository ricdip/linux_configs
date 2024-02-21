{ pkgs, ... }:

{
  home.packages = with pkgs; [ docker ];

  virtualisation.docker = {
    enable = true;
    package = pkgs.docker;
  };
}
