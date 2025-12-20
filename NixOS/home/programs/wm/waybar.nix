{ pkgs, ... }:
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
          # "wlr/taskbar"
          "network"
          "bluetooth"
          "disk"
          "memory"
          "cpu"
        ];
        modules-center = [
          # "sway/window"
          "sway/workspaces"
          "sway/mode"
        ];
        modules-right = [
          "load"
          "temperature"
          "backlight"
          "wireplumber"
          "sway/language"
          "clock"
        ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = false;
        };

        "network" = {
          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%)";
          format-ethernet = "{ipaddr}/{cidr}";
          format-disconnected = "";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)";
          tooltip-format-ethernet = "{ifname}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
        };
      };

      "bluetooth" = {
        format = "{status}";
        format-disabled = "";
        format-connected = "{num_connections} connected";
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      };

      "disk" = {
        interval = 30;
        format = "Only {percentage_free}% remaining on {path}";
        path = "/";
        unit = "GB";
      };

      "memory" = {
        interval = 30;
        format = "{used:0.1f}GB/{total:0.1f}GB";
      };

      "cpu" = {
        interval = 10;
        format = "{}%";
        max-length = 10;
      };

      "load" = {
        interval = 10;
        format = "load: {load1}";
        max-length = 10;
      };

      "temperature" = {
        format = "{temperatureC}°C";
      };

      "backlight" = {
        device = "intel_backlight";
        format = "{percent}%";
      };

      "wireplumber" = {
        format = "{volume}%";
        max-volume = 150;
        scroll-step = 0.2;
      };

      "battery" = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        max-length = 25;
      };

      "sway/language" = {
        format = "{short} {variant}";
      };

      "clock" = {
        interval = 60;
        format = "{%a %d/%m/%Y %H:%M:%S}";
        max-length = 25;
        locale = "it_IT";
      };
    };
  };
}
