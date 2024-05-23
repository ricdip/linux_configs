{ pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.packages = with pkgs;
    [
      "veracrypt" # free Open-Source filesystem on-the-fly encryption
    ];
}
