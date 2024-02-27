{ pkgs, ... }:

{
  # packages that should be installed to the user profile
  home.packages = with pkgs; [
    zip # compressor/archiver
    unzip # extraction utility for archives compressed in .zip format
    ripgrep # better grep
    yq-go # a lightweight and portable command-line YAML, JSON and XML processor (https://github.com/mikefarah/yq)
    htop # interactive process viewer
    neofetch # highly customizable system info script
    btop # monitor of resources
    just # a handy way to save and run project-specific commands
    fd # better find
    xdg-utils # a set of command line tools that assist applications with a variety of desktop integration tasks
    bat # better cat
    glow # render markdown on the CLI
    figlet # program for making large letters out of ordinary text
    tldr # simplified and community-driven man pages
    scc # a very fast accurate code counter with complexity calculations
    duf # disk Usage/Free Utility
    entr # run arbitrary commands when files change
    exiftool # a tool to read, write and edit EXIF meta information
    rsync # fast incremental file transfer utility
    lazydocker # a simple terminal UI for both docker and docker-compose
    lazygit # a simple terminal UI for git commands
  ];
}
