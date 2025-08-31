{ pkgs, ... }:
{
  # enable steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  # enable GameMode to optimise system performance on demand
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud # a Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more
    lutris # open source gaming platform for GNU/Linux
    protonup-ng # CLI program and API to automate the installation and update of GloriousEggroll's Proton-GE
    bottles # wineprefix manager
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
