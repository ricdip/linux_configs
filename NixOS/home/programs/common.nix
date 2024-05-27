{ pkgs, ... }:

{
  # packages that should be installed to the user profile
  home.packages = with pkgs; [
    zip # compressor/archiver
    unzip # extraction utility for archives compressed in .zip format
    ripgrep # better grep
    ripgrep-all # ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, and more
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
    eza # better ls (https://github.com/ogham/exa)
    aria # better wget
    hyperfine # command-line benchmarking tool (https://github.com/sharkdp/hyperfine)
    procs # better ps (https://github.com/dalance/procs)
    xsel # access the clipboard
    bandwhich # a CLI utility for displaying current network utilization (https://github.com/imsnif/bandwhich)
    speedtest-cli # command line speed test utility (https://github.com/sivel/speedtest-cli)
    dogdns # command-line DNS client (https://github.com/ogham/dog)
    navi # interactive cheat sheet
    imagemagick # create, edit, compose, or convert bitmap images
    qrencode # encoding data in a QR Code symbol
    nurl # CLI tool to generate Nix fetcher calls from repository URLs
    helix # a post-modern modal text editor
    nixfmt # a formatter for Nix
    file # a program that shows the type of files
  ];
}
