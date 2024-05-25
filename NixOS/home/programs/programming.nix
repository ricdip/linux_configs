{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ## Programming Languages
    jdk17 # Java
    go # Go
    python312 # Python 3.12
    poetry
    gcc # C/C++
    gnumake
    rustup # Rust
    nodejs_22 # NodeJS 22
    texliveSmall # LaTeX (small)
    ## LSP
    nodePackages_latest.bash-language-server # Bash
    clang # C/C++
    gopls # Go
    python312Packages.python-lsp-server # Python 3.12
    rust-analyzer # Rust
    texlab # LaTeX
    nodePackages_latest.typescript-language-server # TypeScript
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint
    yaml-language-server # YAML
    taplo # TOML
    dockerfile-language-server-nodejs # Dockerfile
    docker-compose-language-service # Docker Compose
    jdt-language-server # Java
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  programs.go = {
    enable = true;
    package = pkgs.go;
  };
}
