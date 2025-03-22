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
    gnumake # build tool
    # Python
    python3 # interpreter
    python3Packages.python-lsp-server # language server
    python3Packages.black # formatter
    # Go
    gopls # language server
    delve # debugger
    # Nix
    nil # language server
    # nixd # language server
    nixfmt-rfc-style # formatter
    # Rust
    cargo # builder
    rustc # compiler
    rust-analyzer # language server
    rustfmt # formatter
    # Maven
    maven
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

  # link installed SDKs to home
  home.file = {
    ".sdks/java-openjdk" = {
      enable = true;
      source = "${pkgs.jdk}/lib/openjdk"; # openjdk implementation of Java
      recursive = false;
    };
  };
}
