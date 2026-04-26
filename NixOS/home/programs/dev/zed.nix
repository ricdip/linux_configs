{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "basher"
      "nix"
      "toml"
      "xml"
      "dockerfile"
      "docker-compose"
      "make"
      "just"
      "sql"
      "nginx"
      "zig"
    ];
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };
      theme = {
        # mode = "system";
        dark = "One Dark";
        # light = "One Light";
        mode = "dark";
      };
      hour_format = "hour24";
      vim_mode = true;
      auto_update = false;
      ui_font_size = 16;
      buffer_font_size = 16;
    };
    userKeymaps = [
      {
        context = "Editor && vim_mode == insert";
        bindings = {
          # Exit insert mode quickly
          "j k" = "vim::NormalBefore";
        };
      }
    ];
  };
}
