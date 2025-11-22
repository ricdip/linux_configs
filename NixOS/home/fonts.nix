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
    # terminus font
    terminus_font
    # nerdfonts: get only a subset
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];

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
