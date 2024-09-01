{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # icon fonts
    material-design-icons
    font-awesome
    # noto fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    # hack font
    hack-font
    # nerdfonts: get only a subset
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
