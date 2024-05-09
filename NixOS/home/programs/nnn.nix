{ pkgs, ... }:

{
  # environment variables for nnn
  home.sessionVariables = { NNN_TMPFILE = "/tmp/.lastd"; };

  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
  };
}
