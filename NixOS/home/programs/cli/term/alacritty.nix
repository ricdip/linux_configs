{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#000000";
          foreground = "#FFFFFF";
        };
        cursor = {
          text = "#000000";
          cursor = "#ffffff";
        };
        selection = {
          text = "#000000";
          background = "#ffffff";
        };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
        };
        size = 12;
      };
      window = {
        dynamic_title = true;
        startup_mode = "Windowed";
        decorations = "full";
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
    };
  };
}
