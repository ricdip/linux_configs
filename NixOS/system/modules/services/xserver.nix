{ pkgs, ... }:
{
  # graphical session to pre-select in session chooser
  services.displayManager.defaultSession = "none+i3";
  # enable the X11 windowing system
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      sessionCommands = ''
        xset r rate 300 40
        xset s 600 600
      '';
    };
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        i3status-rust # replacement for i3status
        i3lock # a simple screen locker
        xss-lock # use external locker (such as i3lock) as X screen saver
        xclip # tool to access the X clipboard from a console application
        brightnessctl # read and control device brightness
        dunst # notification daemon
        arandr # simple visual front end for xrandr
        xdotool # fake keyboard/mouse input, window management, and more
        maim # a command-line screenshot utility
      ];
    };
    # configure keymap in X11
    xkb.layout = "it";
    # xkb.options = "eurosign:e,caps:escape";
  };
}
