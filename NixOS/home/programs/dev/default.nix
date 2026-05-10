{ pkgs, ... }:
{
  imports = [
    ./vscodium.nix
  ];

  # the programming languages are available using nix templates:
  # - to initialize a dev environment: nix flake init -t github:ricdip/nix-templates#java
  # - to show available dev environments: nix flake show github:ricdip/nix-templates
  home.packages = with pkgs; [
    # IDE
    jetbrains.idea-oss
    # Nix
    nil # language server
    # nixd # language server
    nixfmt # formatter
    # keys and certificates
    openssl
  ];

  programs = {
    # direnv
    direnv = {
      enable = true;
      silent = false;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
