{ pkgs, ... }:

{
  allowUnfreePredicate = pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "veracrypt" # free Open-Source filesystem on-the-fly encryption
    ];
}
