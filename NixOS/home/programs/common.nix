{ pkgs, ... }:

{
  # packages that should be installed to the user profile
  home.packages = with pkgs; [ neofetch zip unzip btop nnn just ];
}
