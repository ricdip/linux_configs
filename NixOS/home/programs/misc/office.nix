{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice
    # zathura
  ];
  # PDF viewer
  programs.sioyek = {
    enable = false;
    # https://mynixos.com/home-manager/option/programs.sioyek.config
    config = { };
    # https://mynixos.com/home-manager/option/programs.sioyek.bindings
    bindings = { };
  };
}
