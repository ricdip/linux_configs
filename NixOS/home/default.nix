{ config, pkgs, ... }:

{
  imports = [ ./programs ./shell ];

  home.username = "ricdip";
  home.homeDirectory = "/home/ricdip";

  # value that determines the Home Manager release that the
  # configuration is compatible with. Home Manager can be
  # updated without changing it
  home.stateVersion = "23.11";

  # Home Manager can manage itself
  programs.home-manager.enable = true;
}
