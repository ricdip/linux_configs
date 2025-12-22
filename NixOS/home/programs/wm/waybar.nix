{ consts, ... }:
{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        font-size: 13px;
      }

      window#waybar {
        background-color: rgba(43, 48, 59, 0.5);
        border-bottom: 3px solid rgba(100, 114, 125, 0.5);
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      window#waybar.termite {
        background-color: #3F3F3F;
      }

      window#waybar.chromium {
        background-color: #000000;
        border: none;
      }

      button {
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 0;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
        background: inherit;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.focused, #workspaces button.active {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.urgent {
        background-color: #eb4d4b;
      }

      #mode {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
      }

      #bluetooth,
      #load,
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #language,
      #mpd {
        padding: 0 10px;
        color: #ffffff;
      }

      #window,
      #workspaces {
        margin: 0 4px;
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      label:focus {
        background-color: #000000;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [
          "network"
          "bluetooth"
          "memory"
          "disk"
        ];
        modules-center = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-right = [
          "cpu"
          "load"
          "temperature"
          "backlight"
          "wireplumber"
          "battery"
          "sway/language"
          "clock"
          "tray"
        ];
        # modules configuration
        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
        };
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
          tooltip = false;
        };
        "tray" = {
          spacing = 10;
        };
        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "Wired ";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "Disconnected 󰌙";
          format-disabled = "Disabled 󰌙";
          tooltip-format-wifi = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr}";
          tooltip-disconnected = "Disconnected 󰌙";
          tooltip-disabled = "Disabled 󰌙";
          interval = 2;
          max-length = 30;
        };
        "bluetooth" = {
          format-on = "On ";
          format-connected = "{device_alias} ";
          format-disabled = "Disabled 󰂲";
          format-off = "Off 󰂲";
          format-no-controller = "No controller 󰂲";
          tooltip-format-off = "{status}";
          tooltip-format-on = "{status}";
          tooltip-format-connected = "MAC: {device_address}";
          max-length = 30;
        };
        "disk" = {
          interval = 5;
          format = "{percentage_free}% ";
          path = "/";
          unit = "GB";
          tooltip-format = "{used} / {total} (free: {free})";
        };
        "memory" = {
          interval = 2;
          format = "{percentage}%    / {swapPercentage}% ";
          tooltip-format = "RAM: {used:0.1f}GB / {total:0.1f}GB\nSWAP: {swapUsed:0.1f}GB / {swapTotal:0.1f}GB";
        };
        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          tooltip = false;
        };
        "load" = {
          interval = 2;
          format = "{load1} ";
        };
        "temperature" = {
          interval = 2;
          format = "{temperatureC}°C ";
          critical-threshold = 80;
          warning-threshold = 70;
          tooltip = false;
        };
        "backlight" = {
          interval = 2;
          format = "{percent}% {icon}";
          scroll-step = 5.0;
          tooltip = false;
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "wireplumber" = {
          format = "{volume}% {icon}";
          max-volume = 100;
          scroll-step = 5.0;
          format-muted = "{volume}% ";
          format-icons = [
            ""
            ""
            ""
          ];
          tooltip-format = "{source_desc}";
        };
        "battery" = {
          interval = 5;
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "sway/language" = {
          format = "<span text_transform=\"uppercase\">{short}</span> ";
          on-click = "swaymsg input type:keyboard xkb_switch_layout next";
        };
        "clock" = {
          interval = 1;
          format = "{:%H:%M:%S} ";
          format-alt = "{:L%a %d/%m/%Y} 󰃭";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
          locale = consts.system.locale;
        };
      };
    };
  };
}
