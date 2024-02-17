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

    displayManager = {
      defaultSession = "none+i3";
      lightdm.enable = true;
      # TODO: commands to run before starting i3
      # sessionCommands = ''
      # '';
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
      ];
    };

    layout = "it,us";
    xkb.options = "grp:alt_shift_toggle";
    xkb.variant = "";
  };
}
