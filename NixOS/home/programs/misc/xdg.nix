{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-utils
    handlr
  ];

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/*" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "application/pdf" = [
          "zathura.desktop"
          "firefox.desktop"
        ];
        "image/*" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        "audio/*" = "mpv.desktop";
        "video/*" = "mpv.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
        "text/html" = "firefox.desktop";
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
      };
    };
  };
}
