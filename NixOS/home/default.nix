{ inputs, consts, ... }:
{
  imports = [
    # sops module
    inputs.sops-nix.nixosModules.sops
    ./programs
    ./scripts
    ./fonts.nix
    ./sops.nix
  ];

  home.username = consts.user.name;
  home.homeDirectory = "/home/${consts.user.name}";

  # value that determines the Home Manager release that the
  # configuration is compatible with. Home Manager can be
  # updated without changing it
  home.stateVersion = "24.05";

  # Home Manager can manage itself
  programs.home-manager.enable = true;
}
