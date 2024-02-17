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
      # gaps
      gaps.inner = 5;
      # gaps.outer = 3;
      # key bindings
      keybindings = {
        "${modifier}+Return" = "exec --no-startup-id ${terminal}";
        "${modifier}+q" = "kill";
        "${modifier}+d" = ''
          exec --no-startup-id "${pkgs.rofi}/bin/rofi -modi drun,run -show drun"'';
        "${modifier}+Shift+f" = "exec --no-startup-id i3lock -c 464B8C -e -f";

        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Left" = "focus left";
        "${modifier}+Down" = "focus down";
        "${modifier}+Up" = "focus up";
        "${modifier}+Right" = "focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        "${modifier}+Shift+Left" = "move left";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Right" = "move right";

        "${modifier}+o" = "split h";
        "${modifier}+v" = "split v";
        "${modifier}+f" = "fullscreen toggle";

        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";

        "${modifier}+a" = "focus parent";
        "${modifier}+c" = "focus child";

        "${modifier}+Shift+minus" = "move scratchpad";
        "${modifier}+minus" = "scratchpad show";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";

        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        "${modifier}+p" = "move workspace to output right";

        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+Shift+e" =
          "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

        "${modifier}+r" = "mode resize";

        "XF86AudioRaiseVolume" = ''
          exec --no-startup-id "wpctl set-volume @DEFAULT_SINK@ 5%+ --limit 1.0"
        '';
        "XF86AudioLowerVolume" = ''
          exec --no-startup-id "wpctl set-volume @DEFAULT_SINK@ 5%-"
        '';
        "XF86AudioMute" = ''
          exec --no-startup-id "wpctl set-mute @DEFAULT_SINK@ toggle"
        '';

        # TODO: screen keybindings
        # "XF86MonBrightnessDown" = "";
        # "XF86MonBrightnessUp" = "";
      };
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
            format =
              " $icon $device ^icon_net_down $speed_down ^icon_net_up $speed_up ($ip) ";
            interval = 1;
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
            block = "keyboard_layout";
            driver = "kbddbus";
            format = " $layout ";
            mappings = {
              "English" = "us";
              "Italian" = "it";
            };
          }
          {
            block = "time";
            interval = 60;
            format = " $timestamp.datetime(f:'%a %d/%m/%Y %k:%M') ";
          }
        ];
      };
    };
  };

  # rofi config
  programs.rofi = {
    enable = true;
    theme = "android_notification";
  };

  # picom config
  services.picom = {
    enable = true;
    # fade windows in and out
    fade = true;
    # time between fade animation step (in ms)
    fadeDelta = 3;
  };

  # kbdd service
  systemd.user.services.kbdd = {
    enable = true;
    description = "kbdd service";
    wantedBy = [ "multi-user.target" ];
    script = ''
      ${pkgs.kbdd}/bin/kbdd
    '';
  };
}
