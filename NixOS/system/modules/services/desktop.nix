{ pkgs, ... }:
{
  # Cosmic desktop manager
  services = {
    # displayManager = {
    #   cosmic-greeter.enable = true;
    # };
    desktopManager = {
      cosmic = {
        enable = true;
        xwayland.enable = true;
      };
    };
  };
  # enable the graphical system
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    desktopManager = {
      xterm.enable = false;
    };
    # LightDM login manager
    displayManager = {
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
    desktopManager = {
      xfce = {
        enable = true;
        enableWaylandSession = false;
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
  # Sway window manager
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      # foot # fast, lightweight and minimalistic Wayland terminal emulator
      wl-clipboard # command-line copy/paste utilities for Wayland
      cliphist # Wayland clipboard manager
      swayidle # idle management daemon for Wayland
      swaylock # screen locker for Wayland
      brightnessctl # read and control device brightness
      sway-contrib.grimshot # helper for screenshots within sway
      wdisplays # graphical application for configuring displays in Wayland compositors
      # bemenu # dynamic menu library and client program inspired by dmenu
      wev # Wayland event viewer
      slurp # select a region in a Wayland compositor
      grim # grab images from a Wayland compositor
      gnome-themes-extra # dark adwaita theme
      # wtype # xdotool type for wayland (fake keyboard/mouse input, window management, and more)
      xorg.xhost # solves "Authorization required, but no authorization protocol specified"
      xorg.xeyes # good way to verify X11 setup
    ];
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Ozone Wayland support in Chromium and Electron based applications
    XDG_OPEN_USE_PORTAL = "1";
  };
  # enable screensharing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # desktop integration portals for sandboxed apps
    ];
    xdgOpenUsePortal = true;
    wlr.enable = true;
  };
  environment.systemPackages = with pkgs; [
    # xfce
    xfce.xfce4-volumed-pulse # volume keys control daemon for Xfce using pulseaudio
    redshift # screen color temperature manager for X11 setup
  ];
}
