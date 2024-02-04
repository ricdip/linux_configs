{ pkgs, ... }:

{
  # i3 related options: https://nixos.wiki/wiki/I3

  # links /libexec from derivations to /run/current-system/sw
  environment.pathsToLink = [ "/libexec" ];

  services.xserver = {
    enable = true;

    desktopManager = { xterm.enable = false; };

    displayManager = { defaultSession = "none+i3"; };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      # additional packages installed along with i3
      extraPackages = with pkgs; [
        dmenu
        dunst
        i3status-rust
        i3lock
        i3blocks
        sysstat
        feh
      ];
    };

    layout = "us";
  };
}
