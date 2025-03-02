{ pkgs, ... }:
{
  # preferred browser
  programs.firefox = {
    enable = true;
  };

  # backup browsers
  home.packages = with pkgs; [
    ungoogled-chromium # open source web browser from Google, with dependencies on Google web services removed
    librewolf # fork of Firefox, focused on privacy, security and freedom
  ];
}
