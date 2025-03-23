{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-utils
    handlr
  ];

  xdg = {
    mimeApps = {
      defaultApplications = {
        # application
        "application/json" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "application/yaml" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "application/toml" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "application/xml" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "application/sql" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "application/x-tex" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "application/pdf" = [
          "zathura.desktop"
          "firefox.desktop"
        ];
        "application/x-extension-htm" = "firefox.desktop";
        "application/x-extension-html" = "firefox.desktop";
        "application/x-extension-shtml" = "firefox.desktop";
        "application/xhtml+xml" = "firefox.desktop";
        "application/x-extension-xhtml" = "firefox.desktop";
        "application/x-extension-xht" = "firefox.desktop";
        # audio
        "audio/3gpp" = "mpv.desktop";
        "audio/3gpp2" = "mpv.desktop";
        "audio/aac" = "mpv.desktop";
        "audio/ac3" = "mpv.desktop";
        "audio/flac" = "mpv.desktop";
        "audio/matroska" = "mpv.desktop";
        "audio/mpa" = "mpv.desktop";
        "audio/mp4" = "mpv.desktop";
        "audio/mpeg" = "mpv.desktop";
        "audio/ogg" = "mpv.desktop";
        "audio/opus" = "mpv.desktop";
        "audio/vorbis" = "mpv.desktop";
        "audio/vnd.wav" = "mpv.desktop";
        "audio/webm" = "mpv.desktop";
        # image
        "image/gif" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        "image/heic" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        "image/tiff" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        "image/svg+xml" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        "image/jpeg" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        "image/png" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        "image/webp" = [
          "qimgv.desktop"
          "sxiv.desktop"
        ];
        # text
        "text/plain" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "text/csv" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "text/xml" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "text/html" = "firefox.desktop";
        "text/markdown" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "text/css" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        "text/javascript" = [
          "Helix.desktop"
          "codium.desktop"
        ];
        # video
        "video/3gpp" = "mpv.desktop";
        "video/3gpp2" = "mpv.desktop";
        "video/matroska" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/mpv" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";
        "video/ogg" = "mpv.desktop";
        "video/webm" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        # misc
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/chrome" = "firefox.desktop";
      };
    };
  };
}
