{
  imports = [ ./zsh.nix ./alacritty.nix ];

  # environment variables
  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";
    # TODO: browser var
  };

  # aliases (for all shells)
  home.shellAliases = {
    ls = "ls -h --color=auto --group-directories-first";
    ll = "ls -lh";
  };
}
