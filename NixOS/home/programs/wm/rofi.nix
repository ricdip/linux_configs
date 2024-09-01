{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    theme = "android_notification";
    extraConfig = {
      modi = "combi";
      combi-modes = [
        "window"
        "drun"
        "run"
      ];
      display-combi = ">";
    };
    plugins = with pkgs; [ rofi-power-menu ];
    font = "FiraCode Nerd Font 12";
  };
}
