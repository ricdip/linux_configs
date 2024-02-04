{ pkgs, ... }:

{
  # i3 config
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      # Alt key
      modifier = "Mod1";
      terminal = "alacritty";
      # i3status-rust bar
      bars = [{
        position = "top";
        statusCommand =
          "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
      }];
      # default workspace
      defaultWorkspace = "workspace number 1";
    };
  };

  # i3status-rust config
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [{
          block = "time";
          interval = 60;
          format = "%a %d/%m %k:%M %p";
        }];
      };
    };
  };
}
