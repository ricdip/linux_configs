{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "base16_default_dark";
      editor = {
        line-number = "relative";
        cursorline = true;
        gutters = [
          "diagnostics"
          "spacer"
          "line-numbers"
          "spacer"
          "diff"
        ];
        auto-completion = true;
        auto-format = true;
      };
    };
  };
}
