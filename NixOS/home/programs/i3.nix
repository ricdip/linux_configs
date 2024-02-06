{ pkgs, ... }:

let
  # Alt key
  modifier = "Mod1";
  terminal = "alacritty";
in {
  # i3 config
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      # set modifier and terminal
      inherit modifier terminal;
      # i3status-rust bar
      bars = [{
        position = "top";
        statusCommand =
          "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
      }];
      # default workspace
      defaultWorkspace = "workspace number 1";
      # key bindings
      "${modifier}+Return" = "exec --no-startup-id ${terminal}";
      "${modifier}+d" = "exec --no-startup-id ${pkgs.dmenu}/bin/dmenu_run";
    };
  };

  # i3status-rust config
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        icons = "awesome6";
        theme = "plain";
        blocks = [
          {
            block = "net";
            device = "enp0s3";
            inactive_format = " $icon Down ";
            format = " $icon $device ($ip) ";
            interval = 5;
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            format_alt = " $icon $swap_used_percents ";
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "load";
            interval = 1;
            format = " $icon $1m ";
          }
          { block = "sound"; }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m/%Y %k:%M') ";
          }
        ];
      };
    };
  };
}
