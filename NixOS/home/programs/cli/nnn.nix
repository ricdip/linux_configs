{
  # environment variables for nnn
  home.sessionVariables = {
    # colors
    NNN_COLORS = "6666";
    ## opts:
    # c = cli opener
    # d = detail mode
    # e = text in opener
    # H = show hidden
    # E = use $EDITOR
    NNN_OPTS = "cdeHE";
    # use trash instead of rm
    NNN_TRASH = 1;
  };

  programs.nnn = {
    enable = true;
  };
}
