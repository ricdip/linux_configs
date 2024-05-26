{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ## Programming Languages
    jdk17 # Java
    go # Go
    python3 # Python 3.11
    poetry
    clang # C/C++ (with LSP)
    gnumake
    rustup # Rust (with LSP)
    nodejs_21 # NodeJS 21
    texliveSmall # LaTeX (small)
    ## LSP
    nodePackages_latest.bash-language-server # Bash
    gopls # Go
    python311Packages.python-lsp-server # Python 3.11
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
