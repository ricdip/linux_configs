{ pkgs, ... }:

{
  home.packages = with pkgs; [ git gita ];

  programs.git = {
    enable = true;
    userName = "ricdip";
    # TODO: set email
  };
}
