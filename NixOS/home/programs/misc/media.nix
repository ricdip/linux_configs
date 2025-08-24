{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # audio/video
    mpv # general-purpose media player
    vlc # cross-platform media player and streaming server
    spotify # Spotify official client
    # images
    sxiv # Simple X Image Viewer
    qimgv # a Qt5 image viewer with optional video support
    gimp # the GNU Image Manipulation Program
    imagemagick # create, edit, compose, or convert bitmap images
    exiftool # a tool to read, write and edit EXIF meta information
    # misc
    simplescreenrecorder # a screen recorder for Linux
    ffmpeg # a complete, cross-platform solution to record, convert and stream audio and video
    puddletag # audio tag editor similar to the Windows program, Mp3tag
    mediainfo # supplies technical and tag information about a video or audio file
    yt-dlp # CLI tool to download videos
  ];
}
