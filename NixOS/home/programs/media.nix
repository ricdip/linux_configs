{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # audio
    pavucontrol
    pulsemixer
    # audio/video
    mpv
    vlc
    ffmpeg
    ffmpegthumbnailer
  ];

  programs.mpv = { enable = true; };
}
