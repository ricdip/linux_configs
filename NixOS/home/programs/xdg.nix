{ config, ... }:

{
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";
    mime = { enable = true; };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "audio/*" = [ "mpv.desktop" ];
        "video/*" = [ "mpv.desktop" ];
        "image/*" = [ "feh.desktop" ];
        "image/gif" = [ "mpv.desktop" ];
        "text/*" = [ "vim.desktop" ];
        "application/pdf" = [ "org.pwmt.zathura-pdf-mupdf.desktop" ];
      };
    };
  };
}
