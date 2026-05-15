{
  xdg.configFile."fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json",
      "logo": {
        "padding": {
          "top": 10
        } 
      },
      "modules": [
        "title",
        "separator",
        "os",
        "host",
        "bios",
        "kernel",
        "initsystem",
        "break",
        "users",
        "uptime",
        "loadavg",
        "packages",
        "shell",
        "editor",
        "break",
        "display",
        "de",
        "lm",
        "wm",
        "wmtheme",
        "theme",
        "icons",
        "font",
        "cursor",
        "terminal",
        "terminalfont",
        "break",
        "cpu",
        "gpu",
        "memory",
        "swap",
        "disk",
        "btrfs",
        "break",
        "localip",
        "dns",
        "battery",
        "poweradapter",
        "locale",
        "break",
        "colors"
      ]
    }
  '';
}
