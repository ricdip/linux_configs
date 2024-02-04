{ pkgs, ... }:

{
  # i3 config
  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.config = {
    # Alt key
    modifier = "Mod1";
    terminal = "alacritty";
    # i3status bar
    bars = [{ position = "top"; }];
  };
}
