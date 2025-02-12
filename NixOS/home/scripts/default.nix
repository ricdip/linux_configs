{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "pdf-merger" (builtins.readFile ./pdf-merger.sh))
  ];
}
