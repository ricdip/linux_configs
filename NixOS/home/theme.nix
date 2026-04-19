{ pkgs, config, ... }:
{
  # GTK/QT
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "Adwaita-dark";
      package = pkgs.adw-gtk3; # theme from libadwaita ported to GTK-3
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
    gtk4.theme = config.gtk.theme;
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk2";
    style = {
      name = "adwaita-dark";
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
