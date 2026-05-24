{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#000000";
          foreground = "#ffffff";
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
        decorations = "Full";
        dynamic_padding = true;
        resize_increments = true;
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      keyboard = {
        bindings = [
          # copy
          {
            key = "C";
            mods = "Control|Shift";
            action = "Copy";
          }

          # paste
          {
            key = "V";
            mods = "Control|Shift";
            action = "Paste";
          }

          # vi mode toggle
          {
            key = "Space";
            mods = "Control|Shift";
            action = "ToggleViMode";
          }

          # search
          {
            key = "F";
            mods = "Control|Shift";
            action = "SearchForward";
          }

          # font zoom in
          {
            key = "Equals";
            mods = "Control";
            action = "IncreaseFontSize";
          }

          # font zoom out
          {
            key = "Minus";
            mods = "Control";
            action = "DecreaseFontSize";
          }

          # reset font size
          {
            key = "Key0";
            mods = "Control";
            action = "ResetFontSize";
          }

          # clear terminal
          {
            key = "L";
            mods = "Control|Shift";
            chars = "\\u000c";
          }

          # page up/down in scrollback
          {
            key = "PageUp";
            mods = "Shift";
            action = "ScrollPageUp";
          }

          {
            key = "PageDown";
            mods = "Shift";
            action = "ScrollPageDown";
          }

          # top/bottom scrollback
          {
            key = "Home";
            mods = "Shift";
            action = "ScrollToTop";
          }

          {
            key = "End";
            mods = "Shift";
            action = "ScrollToBottom";
          }
        ];
      };
    };
  };
}
