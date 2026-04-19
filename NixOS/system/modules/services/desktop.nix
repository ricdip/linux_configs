{
  pkgs,
  config,
  inputs,
  ...
}:
{
  # enable the graphical system
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      # LightDM login manager
      lightdm = {
        enable = true;
        greeters.gtk = {
          enable = true;
          theme = {
            name = "Adwaita-dark";
          };
          cursorTheme = {
            package = pkgs.openzone-cursors;
            name = "OpenZone_Black";
            size = 32;
          };
        };
      };
    };
    # Xfce desktop manager
    # desktopManager = {
    #   xfce = {
    #     enable = true;
    #     enableWaylandSession = false;
    #   };
    # };
    # configure keymap in X11 for console
    xkb = {
      layout = "it,us";
      variant = "winkeys";
      # options:
      # - eurosign:e              -> Euro on E
      # - grp:lwin_toggle         -> Switching to another layout on Left Win
      options = "eurosign:e,grp:lwin_toggle";
    };
  };
  # Niri window manager
  programs.niri = {
    enable = true;
    useNautilus = true;
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Ozone Wayland support in Chromium and Electron based applications
  };
  # enable screensharing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # desktop integration portals for sandboxed apps
      xdg-desktop-portal-gnome # backend implementation for xdg-desktop-portal for the GNOME desktop environment
    ];
    xdgOpenUsePortal = true;
    wlr.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # xfce desktop manager
    # xfce.xfce4-volumed-pulse # volume keys control daemon for Xfce using pulseaudio
    # redshift # screen color temperature manager for X11 setup
    # niri window manager
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite # Xwayland outside your Wayland compositor
    wdisplays # graphical application for configuring displays in Wayland compositors
    wev # Wayland event viewer
  ];
}
