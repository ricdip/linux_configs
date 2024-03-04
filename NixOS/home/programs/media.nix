{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # audio
    pavucontrol
    pulsemixer
    # audio/video
    mpv
    ffmpeg
  ];

  programs.mpv = { enable = true; };
}
