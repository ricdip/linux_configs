{ pkgs, ... }:
{
  # GTK/QT
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
    };
    cursorTheme = {
      package = pkgs.openzone-cursors;
      name = "OpenZone_Black";
      size = 32;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    gtk3 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };
  # cursor
  home.pointerCursor = {
    gtk.enable = true;
    sway.enable = true;
    package = pkgs.openzone-cursors;
    name = "OpenZone_Black";
    size = 32;
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita-dark";
      color-scheme = "prefer-dark";
    };
  };
}
