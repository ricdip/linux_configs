{ config, ... }:
{
  # preferred browser
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
}
