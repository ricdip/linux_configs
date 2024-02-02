{ pkgs, ... }:

{
  home.packages = with pkgs; [ git ];

  programs.git = {
    enable = true;
    # TODO: set username and email
  };
}
