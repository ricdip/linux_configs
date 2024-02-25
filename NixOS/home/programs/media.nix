{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # audio
    pavucontrol
    pulsemixer
    # audio/video
    mpv
  ];

  programs.mpv = { enable = true; };
}
