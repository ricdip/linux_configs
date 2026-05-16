{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-utils
    # handlr
  ];

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # application
        "application/json" = [
          "nvim.desktop"
        ];
        "application/yaml" = [
          "nvim.desktop"
        ];
        "application/toml" = [
          "nvim.desktop"
        ];
        "application/xml" = [
          "nvim.desktop"
        ];
        "application/sql" = [
          "nvim.desktop"
        ];
        "application/x-tex" = [
          "nvim.desktop"
        ];
        "application/pdf" = [
          "firefox.desktop"
        ];
        "application/x-extension-htm" = [ "firefox.desktop" ];
        "application/x-extension-html" = [ "firefox.desktop" ];
        "application/x-extension-shtml" = [ "firefox.desktop" ];
        "application/xhtml+xml" = [ "firefox.desktop" ];
        "application/x-extension-xhtml" = [ "firefox.desktop" ];
        "application/x-extension-xht" = [ "firefox.desktop" ];
        # audio
        "audio/3gpp" = [ "mpv.desktop" ];
        "audio/3gpp2" = [ "mpv.desktop" ];
        "audio/aac" = [ "mpv.desktop" ];
        "audio/ac3" = [ "mpv.desktop" ];
        "audio/flac" = [ "mpv.desktop" ];
        "audio/matroska" = [ "mpv.desktop" ];
        "audio/mpa" = [ "mpv.desktop" ];
        "audio/mp4" = [ "mpv.desktop" ];
        "audio/mpeg" = [ "mpv.desktop" ];
        "audio/ogg" = [ "mpv.desktop" ];
        "audio/opus" = [ "mpv.desktop" ];
        "audio/vorbis" = [ "mpv.desktop" ];
        "audio/vnd.wav" = [ "mpv.desktop" ];
        "audio/webm" = [ "mpv.desktop" ];
        # image
        "image/gif" = [
          "imv.desktop"
        ];
        "image/heic" = [
          "imv.desktop"
        ];
        "image/tiff" = [
          "imv.desktop"
        ];
        "image/svg+xml" = [
          "imv.desktop"
        ];
        "image/jpeg" = [
          "imv.desktop"
        ];
        "image/png" = [
          "imv.desktop"
        ];
        "image/webp" = [
          "imv.desktop"
        ];
        # text
        "text/plain" = [
          "nvim.desktop"
        ];
        "text/csv" = [
          "nvim.desktop"
        ];
        "text/xml" = [
          "nvim.desktop"
        ];
        "text/html" = [ "firefox.desktop" ];
        "text/markdown" = [
          "nvim.desktop"
        ];
        "text/css" = [
          "nvim.desktop"
        ];
        "text/javascript" = [
          "nvim.desktop"
        ];
        # video
        "video/3gpp" = [ "mpv.desktop" ];
        "video/3gpp2" = [ "mpv.desktop" ];
        "video/matroska" = [ "mpv.desktop" ];
        "video/mp4" = [ "mpv.desktop" ];
        "video/mpv" = [ "mpv.desktop" ];
        "video/mpeg" = [ "mpv.desktop" ];
        "video/ogg" = [ "mpv.desktop" ];
        "video/webm" = [ "mpv.desktop" ];
        "video/x-matroska" = [ "mpv.desktop" ];
        # misc
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
        "x-scheme-handler/chrome" = [ "firefox.desktop" ];
        "inode/directory" = [ "thunar.desktop" ];
      };
    };
  };
}
