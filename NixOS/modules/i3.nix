{ pkgs, ... }:

{
  # i3 related options: https://nixos.wiki/wiki/I3

  # links /libexec from derivations to /run/current-system/sw
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
      # loaded wallpaper in ~/.background-image
      wallpaper.mode = "scale";
    };

    excludePackages = with pkgs; [ xterm ];

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
      # commands to run before starting i3
      sessionCommands = ''
        ${pkgs.kbdd}/bin/kbdd
        xset r rate 300 40
        xset s off
        xset -dpms
        xset s noblank
      '';
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      # additional packages installed along with i3
      extraPackages = with pkgs; [
        rofi
        dunst
        i3status-rust
        i3lock
        i3blocks
        xautolock
        acpi
        arandr
        dex
        feh
        xbindkeys
        xorg.xbacklight
        xorg.xdpyinfo
        sysstat
        picom
        kbdd
      ];
    };

    layout = "it,us";
    xkb.options = "grp:alt_space_toggle"; # or grp:alt_shift_toggle
    xkb.variant = "qwerty";
  };
}
