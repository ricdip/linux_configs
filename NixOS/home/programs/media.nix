{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # audio
    pavucontrol
    pulsemixer
    # audio/video
    mpv
    ffmpeg
    ffmpegthumbnailer
  ];

  programs.mpv = { enable = true; };
}
