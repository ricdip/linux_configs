{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./ide.nix
    ./vscodium.nix
  ];

  home.packages = with pkgs; [
    # C/C++
    clang # compiler
    clang-tools # formatter, language server
    lldb # debugger
    # Python
    python3 # interpreter
    python3Packages.python-lsp-server # language server
    python3Packages.black # formatter
    # Go
    gopls # language server
    delve # debugger
    # Nix
    nil # language server
    nixfmt-rfc-style # formatter
    # Rust
    cargo # builder
    rust-analyzer # language server
    rustfmt # formatter
  ];

  programs = {
    # Java
    java = {
      enable = true;
      package = pkgs.jdk; # latest Java JDK
    };
    # Go
    go = {
      enable = true;
      package = pkgs.go; # latest Go
      goPath = ".go";
    };
  };
}
