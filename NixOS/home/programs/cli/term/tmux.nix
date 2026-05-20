{
  programs.tmux = {
    enable = true;
    keyMode = "emacs";
    clock24 = true;
    historyLimit = 5000;
    # base index for windows and panes
    baseIndex = 1;
    # time in milliseconds for which tmux waits after an escape is input
    escapeTime = 0;
    # automatically spawn a session if trying to attach and none are running
    newSession = true;
    extraConfig = ''
      set -g mouse on
    '';
  };
}
