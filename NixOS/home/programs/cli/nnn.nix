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
    # U = no auto-up
    # E = use $EDITOR
    NNN_OPTS = "cdeHUE";
    # use trash instead of rm
    NNN_TRASH = 1;
    ## previews
    NNN_FIFO = "/tmp/nnn.fifo";
  };

  programs.nnn = {
    enable = true;
  };
}
