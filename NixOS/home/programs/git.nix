{ pkgs, ... }:

{
  home.packages = with pkgs; [ git ];

  programs.git = {
    enable = true;
    userName = "ricdip";
    # TODO: set email
  };
}
