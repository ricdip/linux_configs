{ config, ... }:

{
  imports = [ ./zsh.nix ];

  # environment variables
  home.sessionVariables = {
    EDITOR = "vim";
    # TODO: browser and terminal vars
  };

  # aliases (for all shells)
  home.shellAliases = {
    ls = "ls -h --color=auto --group-directories-first";
    ll = "ls -lh";
  };
}
