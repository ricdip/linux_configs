{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libreoffice # comprehensive, professional-quality productivity suite, a variant of openoffice.org
    # sioyek # PDF viewer designed for research papers and technical books
  ];
  programs.zathura = {
    enable = true;
    options = {
      "adjust-open" = "best-fit";
      "recolor" = true;
      "recolor-keephue" = true;
      "statusbar-h-padding" = 0;
      "statusbar-v-padding" = 0;
      "incremental-search" = true;
      "page-padding" = 2;
      "selection-clipboard" = "clipboard";
    };
    mappings = {
      "t" = "toggle_page_mode";
      "J" = "zoom out";
      "K" = "zoom in";
      "f" = "adjust_window best-fit";
      "w" = "adjust_window width";
      "R" = "rotate";
      "d" = "scroll half-down";
      "u" = "scroll half-up";
      "i" = "recolor";
      "p" = "print";
      "r" = "reload";
    };
  };
}
