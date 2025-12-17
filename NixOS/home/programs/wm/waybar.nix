{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "wlr/taskbar"
          "network"
          "bluetooth"
          "disk"
          "memory"
          "cpu"
        ];
        modules-center = [
          "sway/window"
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
