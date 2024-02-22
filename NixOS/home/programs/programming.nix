{ pkgs, ... }:

{
  home.packages = with pkgs; [ jdk17 go python3 poetry rustup ];

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  programs.go = {
    enable = true;
    package = pkgs.go;
  };
}
