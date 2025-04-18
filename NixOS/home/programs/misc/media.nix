{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # audio/video
    mpv # general-purpose media player
    spotify # Spotify official client
    # images
    sxiv # Simple X Image Viewer
    qimgv # a Qt5 image viewer with optional video support
    gimp # the GNU Image Manipulation Program
    # misc
    simplescreenrecorder # a screen recorder for Linux
    ffmpeg # a complete, cross-platform solution to record, convert and stream audio and video
    puddletag # audio tag editor similar to the Windows program, Mp3tag
  ];
}
