{ pkgs, ... }:

{
  # packages that should be installed to the user profile
  home.packages = with pkgs; [
    zip
    unzip
    ripgrep
    yq-go # https://github.com/mikefarah/yq
    htop
    neofetch
    btop
    nnn
    just
    fd
    xdg-utils
    bat
  ];
}
