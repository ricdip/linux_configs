{ pkgs, ... }:
{
  # enable the graphical system
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      lightdm = {
        enable = false;
        greeters.gtk = {
          enable = false;
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
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      foot # fast, lightweight and minimalistic Wayland terminal emulator
      wl-clipboard # command-line copy/paste utilities for Wayland
      cliphist # Wayland clipboard manager
      swayidle # idle management daemon for Wayland
      swaylock # screen locker for Wayland
      brightnessctl # read and control device brightness
      sway-contrib.grimshot # helper for screenshots within sway
      wdisplays # graphical application for configuring displays in Wayland compositors
      bemenu # dynamic menu library and client program inspired by dmenu
      wev # Wayland event viewer
      slurp # select a region in a Wayland compositor
      grim # grab images from a Wayland compositor
      gnome-themes-extra # dark adwaita theme
      wtype # xdotool type for wayland (fake keyboard/mouse input, window management, and more)
      xorg.xhost # solves "Authorization required, but no authorization protocol specified"
      xorg.xeyes # good way to verify X11 setup
    ];
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Ozone Wayland support in Chromium and Electron based applications
  };
  # enable screensharing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # desktop integration portals for sandboxed apps
      xdg-desktop-portal-wlr # xdg-desktop-portal backend for wlroots
      xdg-desktop-portal-gnome # backend implementation for xdg-desktop-portal for the GNOME desktop environment
    ];
    xdgOpenUsePortal = true;
    wlr.enable = true;
  };
}
