{ pkgs, ... }:

{
  # i3 config
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      # Alt key
      modifier = "Mod1";
      terminal = "alacritty";
      # i3status bar
      bars = [{ position = "top"; }];
      # default workspace
      defaultWorkspace = "workspace number 1";
    };
  };

  # i3status config
  programs.i3status = {
    enable = true;
    enableDefault = true;
  };
}
