{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # nix
      jnoortheen.nix-ide
      # utility
      eamodio.gitlens
      oderwat.indent-rainbow
      grapecity.gc-excelviewer
      # docs
      bierner.markdown-mermaid
      # frontend
      ecmel.vscode-html-css
      bradlc.vscode-tailwindcss
      astro-build.astro-vscode
      angular.ng-template
      # programming languages
      golang.go
      ms-python.python
      rust-lang.rust-analyzer
      tiehuis.zig
    ];
  };
}
