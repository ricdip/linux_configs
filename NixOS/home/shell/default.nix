{ config, ... }:

{
  imports = [
    ./zsh.nix
  ];

  # environment variables
  home.sessionVariables = {
    EDITOR = "vim";
    # TODO: browser and terminal vars
  };

  # aliases (for all shells)
  home.shellAliases = {
    ll = "ls -la";
  };
}
