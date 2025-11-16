{ pkgs, ... }:
{
  # enable the graphical system
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    desktopManager = {
      xterm.enable = false;
      wallpaper = {
        # TODO: solve wallpaper in wayland
        combineScreens = false;
        mode = "fill";
      };
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
    # TODO: port to wayland
    # windowManager.i3 = {
    #   enable = true;
    #   package = pkgs.i3-gaps;
    #   extraPackages = with pkgs; [
    #     i3status-rust # replacement for i3status
    #     i3lock # a simple screen locker
    #     xss-lock # use external locker (such as i3lock) as X screen saver
    #     xclip # tool to access the X clipboard from a console application
    #     brightnessctl # read and control device brightness
    #     dunst # notification daemon
    #     arandr # simple visual front end for xrandr
    #     xdotool # fake keyboard/mouse input, window management, and more
    #     maim # a command-line screenshot utility
    #     feh # light-weight image viewer
    #     xkblayout-state # CLI program to get/set the current XKB keyboard layout
    #   ];
    # };
  };
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      foot # fast, lightweight and minimalistic Wayland terminal emulator
      i3status-rust # replacement for i3status
      wl-clipboard # command-line copy/paste utilities for Wayland
      swayidle # idle management daemon for Wayland
      swaylock # screen locker for Wayland
      brightnessctl # read and control device brightness
      dunst # notification daemon
      sway-contrib.grimshot # helper for screenshots within sway
      wdisplays # graphical application for configuring displays in Wayland compositors
      bemenu # dynamic menu library and client program inspired by dmenu
    ];
  };
}
