{
  programs.alacritty = {
    enable = true;
    settings = {
      colors.primary = {
        background = "#000000";
        foreground = "#FFFFFF";
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
        };
        size = 12;
      };
      window.dynamic_title = true;
    };
  };
}
