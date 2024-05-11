{ pkgs, ... }:

{
  home.packages = with pkgs; [ tmux ];

  # environment variables for nnn
  home.sessionVariables = {
    NNN_TMPFILE = "/tmp/.lastd";
    NNN_COLORS = "6666";
    NNN_PLUG = "p:preview-tui";
    NNN_TERMINAL = "alacritty";
    NNN_PREVIEWDIR = "/tmp/nnn/previews";
    NNN_FIFO = "/tmp/nnn.fifo";
  };

  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    plugins.src = (pkgs.fetchFromGitHub {
      owner = "jarun";
      repo = "nnn";
      rev = "v4.9";
      sha256 = "sha256-g19uI36HyzTF2YUQKFP4DE2ZBsArGryVHhX79Y0XzhU=";
    }) + "/plugins";
  };
}
