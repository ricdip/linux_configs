{
  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        icons = "awesome6";
        theme = "plain";
        blocks = [
          {
            block = "net";
            format = " $icon {$ssid ($signal_strength): $ip|Wired: $ip} ";
            inactive_format = " $icon Down ";
            interval = 2;
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
            interval = 5;
            warning = 20.0;
            alert = 10.0;
            format = " $icon $available / $total ";
          }
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            format_alt = " $icon_swap $swap_used_percents ";
            interval = 2;
          }
          {
            block = "cpu";
            format = " $icon $utilization ";
            interval = 2;
          }
          {
            block = "load";
            format = " $icon $1m.eng(w:4) ";
            interval = 1;
          }
          {
            block = "temperature";
            format = " $icon $max ";
            scale = "celsius";
            interval = 2;
          }
          {
            block = "backlight";
            format = " $icon $brightness ";
            step_width = 5;
            minimum = 5;
            maximum = 100;
            invert_icons = true;
          }
          {
            block = "sound";
            format = " $icon {$volume.eng(w:2)|} ";
            max_vol = 100;
            step_width = 5;
            show_volume_when_muted = true;
          }
          {
            block = "battery";
            interval = 5;
            format = " $icon $percentage ";
            full_format = " $icon $percentage ";
            charging_format = " $icon $percentage ";
            empty_format = " $icon $percentage ";
          }
          {
            block = "keyboard_layout";
            driver = "kbddbus";
            mappings = {
              "English (US)" = "EN";
              "Italian (N/A)" = "IT";
            };
            format = " $layout ";
          }
          {
            block = "time";
            interval = 1;
            format = " $timestamp.datetime(f:'%a %d/%m/%Y %H:%M:%S', l:it_IT) ";
          }
        ];
      };
    };
  };
}
