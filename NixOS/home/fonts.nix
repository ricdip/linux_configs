{ pkgs, ... }:
{
  # fonts
  home.packages = with pkgs; [
    # icon fonts
    material-design-icons
    font-awesome
    # noto fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    # hack font
    hack-font
    # nerdfonts: get only a subset
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "left_ptr";
    };
    package = pkgs.openzone-cursors;
    name = "OpenZone_Black";
    size = 32;
  };
}
