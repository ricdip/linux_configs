{ pkgs, ... }:

{
  home.packages = with pkgs; [ jdk17 go ];

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  programs.go = {
    enable = true;
    package = pkgs.go;
  };
}
