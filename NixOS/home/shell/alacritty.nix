{ pkgs, ... }:

{
  home.packages = with pkgs; [ alacritty ];

  programs.alacritty = {
    enable = true;
    # alacritty config
    settings = {
      colors.normal = {
        black = "#000000";
        blue = "#5555FF";
        cyan = "#55FFFF";
        green = "#00AA00";
        magenta = "#FF55FF";
        red = "#BA110C";
        white = "#FFFFFF";
        yellow = "#F4C430";
      };
      colors.primary = {
        background = "#000000";
        foreground = "#FFFFFF";
      };
      font.normal = { family = "JetBrainsMono Nerd Font"; };
      window.dynamic_title = true;
    };
  };
}
