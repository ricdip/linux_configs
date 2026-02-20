{ pkgs, ... }:
{
  imports = [
    ./helix.nix
    ./ide.nix
    ./vscodium.nix
  ];

  home.packages = with pkgs; [
    # Assembly
    nasm # 80x86 and x86-64 assembler
    # C/C++
    # clang # compiler
    # lldb # next-generation high-performance debugger
    clang-tools # formatter, language server
    gcc # GNU Compiler Collection
    gdb # GNU Project debugger
    gdbgui # browser-based frontend for GDB
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
    # Zig
    zig # compiler
    zls # language server
    # databases
    dbeaver-bin
    # certs
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
    # Java
    java = {
      enable = true;
      package = pkgs.jdk; # latest Java JDK
    };
    # Go
    go = {
      enable = true;
      package = pkgs.go; # latest Go
      env = {
        GOPATH = ".go";
      };
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
