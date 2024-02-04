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
          "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-default.toml";
      }];
      # default workspace
      defaultWorkspace = "workspace number 1";
    };
  };

  # i3status-rust config
  # TODO: custom config
  programs.i3status-rust = { enable = true; };
}
