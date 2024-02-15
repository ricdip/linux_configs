{ constants, ... }:

{
  imports = [ ./programs ./shell ];

  home.username = constants.user.name;
  home.homeDirectory = "/home/${constants.user.name}";

  # value that determines the Home Manager release that the
  # configuration is compatible with. Home Manager can be
  # updated without changing it
  home.stateVersion = "23.11";

  # Home Manager can manage itself
  programs.home-manager.enable = true;
}
