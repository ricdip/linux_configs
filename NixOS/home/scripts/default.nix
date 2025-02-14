{ pkgs, ... }:
{
  # bash scripts handling
  home.packages = with pkgs; [
    (writeShellScriptBin "pdf-merger" (
      lib.strings.removePrefix "#!/bin/env bash\n" (builtins.readFile ./pdf-merger.sh)
    ))
  ];
}
