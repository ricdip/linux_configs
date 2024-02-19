{ pkgs, ... }:

{
  home.packages = with pkgs; [ jdk17 ];

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
