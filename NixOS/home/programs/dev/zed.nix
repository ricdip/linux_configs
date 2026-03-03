{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "basher"
      "java"
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
      "base16"
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
        # dark = "One Dark";
        # light = "One Light";
        mode = "dark";
        dark = "base16-ocean";
      };
      hour_format = "hour24";
      vim_mode = true;
      auto_update = true;
      ui_font_size = 16;
      buffer_font_size = 16;
      lsp = {
        "jdtls" = {
          "settings" = {
            "java_home" = "${pkgs.jdk}/lib/openjdk";
            "lombok_support" = true;
            "jdk_auto_download" = false;
            "check_updates" = "always";
          };
        };
      };
    };
    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          ctrl-shift-t = "workspace::NewTerminal";
        };
      }
      {
        context = "Editor && vim_mode == insert";
        bindings = {
          "j k" = "vim::NormalBefore";
        };
      }
    ];
  };
}
