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
  };
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      foot # fast, lightweight and minimalistic Wayland terminal emulator
      i3status-rust # replacement for i3status
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
      adwaita-icon-theme # mouse cursor and icons
      gnome-themes-extra # dark adwaita theme
      wtype # xdotool type for wayland (fake keyboard/mouse input, window management, and more)
    ];
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Ozone Wayland support in Chromium and Electron based applications
  };
  # enable screensharing
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
