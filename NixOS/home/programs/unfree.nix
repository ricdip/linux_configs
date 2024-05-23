{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      veracrypt # free Open-Source filesystem on-the-fly encryption
    ];
}
