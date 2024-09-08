{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      astro-build.astro-vscode
      eamodio.gitlens
      oderwat.indent-rainbow
      ecmel.vscode-html-css
      bradlc.vscode-tailwindcss
    ];
  };
}
