{ pkgs, consts, ... }:

let
  # Alt key
  modifier = "Mod1";
  terminal = "alacritty";
  i3-fonts = {
    names = [
      "DejaVu Sans Mono"
      "Font Awesome 6 Free"
    ];
    size = 10.0;
  };
  swaylock-command = "swaylock -f -c 000000";
  lock-timeout = "1800";
  screen-poweroff-timeout = "1860";
in
{
  # sway config
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    checkConfig = false;
    extraConfig = ''
      exec swayidle -w \
        timeout ${lock-timeout} '${swaylock-command}' \
        timeout ${screen-poweroff-timeout} 'swaymsg "output * power off"' \
                resume 'swaymsg "output * power on"' \
        before-sleep '${swaylock-command}' \
        lock '${swaylock-command}'
      for_window [app_id="^.*"] inhibit_idle fullscreen
      output * bg /home/${consts.user.name}/.background-image fill
      seat * hide_cursor 10000
      exec wl-paste --watch cliphist store
      for_window [shell="xwayland"] title_format "[XWayland] %title"
      for_window [window_role = "pop-up"] floating enable
      for_window [window_role = "bubble"] floating enable
      for_window [window_role = "dialog"] floating enable
      for_window [window_type = "dialog"] floating enable
      for_window [window_role = "task_dialog"] floating enable
      for_window [window_type = "menu"] floating enable
      for_window [app_id = "floating"] floating enable
      for_window [app_id = "floating_update"] floating enable, resize set width 1000px height 600px
      for_window [class = "(?i)pinentry"] floating enable
      for_window [title = "Administrator privileges required"] floating enable
    '';
    config = {
      # set modifier and terminal
      inherit modifier terminal;
      # i3status-rust bar
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          fonts = {
            names = i3-fonts.names;
            size = i3-fonts.size;
          };
        }
      ];
      fonts = {
        names = i3-fonts.names;
        size = i3-fonts.size;
      };
      # keyboard configuration
      input."*" = {
        xkb_layout = "it,us";
        xkb_variant = "winkeys";
        # options:
        # - eurosign:e              -> Euro on E
        # - grp:lwin_toggle         -> Switching to another layout on Left Win
        xkb_options = "eurosign:e,grp:lwin_toggle";
        repeat_delay = "300";
        repeat_rate = "40";
      };
      # default workspace
      defaultWorkspace = "workspace number 1";
      # gaps
      gaps.inner = 5;
      # gaps.outer = 3;
      # key bindings
      keybindings = {
        "${modifier}+Return" = "exec --no-startup-id ${terminal}";
        "${modifier}+q" = "kill";
        "${modifier}+d" = ''exec --no-startup-id "${pkgs.rofi}/bin/rofi -show combi"'';

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

        "${modifier}+Shift+r" = "reload";
        "${modifier}+Shift+e" = ''
          exec --no-startup-id "${pkgs.rofi}/bin/rofi -show power-menu -modi 'power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu --choices=lockscreen/logout/reboot/shutdown'"
        '';

        "${modifier}+r" = "mode resize";

        "XF86AudioRaiseVolume" = ''
          exec --no-startup-id "wpctl set-volume @DEFAULT_SINK@ 5%+ --limit 1.0"
        '';
        "XF86AudioLowerVolume" = ''
          exec --no-startup-id "wpctl set-volume @DEFAULT_SINK@ 5%- --limit 0.0"
        '';
        "XF86AudioMute" = ''
          exec --no-startup-id "wpctl set-mute @DEFAULT_SINK@ toggle"
        '';

        "XF86MonBrightnessDown" = ''
          exec --no-startup-id "brightnessctl set 5%-"
        '';
        "XF86MonBrightnessUp" = ''
          exec --no-startup-id "brightnessctl set +5%"
        '';

        "Print" = "exec grimshot save area";
        "Shift+Print" = "exec grimshot save window";
        "Control+Shift+Print" = "exec grimshot save output";

        "Control+grave" = "exec 'cliphist list | rofi -dmenu | cliphist decode | wl-copy'"; # US layout
        "Control+backslash" = "exec 'cliphist list | rofi -dmenu | cliphist decode | wl-copy'"; # IT layout

        "${modifier}+F1" = ''
          exec 'bluetoothctl show | grep -q "Powered: yes" && bluetoothctl power off || bluetoothctl power on'
        '';

        "${modifier}+F2" = ''
          exec 'nmcli networking | grep -q "enabled" && nmcli networking off || nmcli networking on'
        '';
      };

      modes = {
        resize = {
          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";

          "h" = "resize shrink width 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "j" = "resize shrink height 10 px or 10 ppt";
          "l" = "resize grow width 10 px or 10 ppt";

          "Return" = "mode default";
          "Escape" = "mode default";
          "${modifier}+r" = "mode default";
        };
      };
    };
  };
}
