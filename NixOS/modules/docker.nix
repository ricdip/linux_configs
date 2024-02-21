{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker;
  };
}
