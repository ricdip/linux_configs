{
  services.picom = {
    enable = true;
    fade = true;
    fadeDelta = 3;
    fadeSteps = [
      3.0e-2
      3.0e-2
    ];
    vSync = true;
    wintypes = {
      tooltip = {
        fade = true;
        shadow = true;
        opacity = 1.0;
        focus = true;
        full-shadow = false;
      };
      dock = {
        shadow = false;
        clip-shadow-above = true;
      };
      dnd = {
        shadow = false;
      };
      popup_menu = {
        opacity = 1.0;
      };
      dropdown_menu = {
        opacity = 1.0;
      };
    };
  };
}
