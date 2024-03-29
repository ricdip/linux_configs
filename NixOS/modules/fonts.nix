{ pkgs, ... }:

{
  # fonts
  fonts.packages = with pkgs; [
    # icon fonts
    material-design-icons
    font-awesome
    # normal fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    # nerdfonts: get only a subset
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
}
