{ pkgs, ... }:

{
  imports = [
    ./cli
    ./dev
    ./misc
    ./wm
  ];

  # packages that should be installed to the user profile
  home.packages = with pkgs; [
    zip # compressor/archiver
    unzip # extraction utility for archives compressed in .zip format
    xz # a general-purpose data compression software,
    p7zip # a p7zip fork with additional codecs and improvements
    ripgrep # better grep
    ripgrep-all # ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, and more
    fd # better find
    fzf # command-line fuzzy finder
    jq # a lightweight and flexible command-line JSON processor
    yq-go # a lightweight and portable command-line YAML, JSON and XML processor (https://github.com/mikefarah/yq)
    htop # interactive process viewer
    fastfetch # highly customizable system info script (like neofetch)
    btop # monitor of resources
    glances # cross-platform curses-based monitoring tool
    just # a handy way to save and run project-specific commands
    gita # command-line tool to manage multiple git repos
    mtr # a network diagnostics tool
    bat # better cat
    glow # render markdown on the CLI
    figlet # program for making large letters out of ordinary text
    tldr # simplified and community-driven man pages
    scc # a very fast accurate code counter with complexity calculations
    duf # disk Usage/Free Utility
    entr # run arbitrary commands when files change
    rsync # fast incremental file transfer utility
    tree # command to produce a depth indented directory listing
    lazydocker # a simple terminal UI for both docker and docker-compose
    lazygit # a simple terminal UI for git commands
    eza # better ls (https://github.com/ogham/exa)
    aria2 # better wget
    sd # sed alternative
    diff-so-fancy # alternative diff filter for git
    tre-command # improved tree command
    dua # a tool to conveniently learn about the disk usage of directories
    hyperfine # command-line benchmarking tool (https://github.com/sharkdp/hyperfine)
    procs # better ps (https://github.com/dalance/procs)
    bandwhich # a CLI utility for displaying current network utilization (https://github.com/imsnif/bandwhich)
    # speedtest-cli # command line speed test utility (https://github.com/sivel/speedtest-cli)
    dogdns # command-line DNS client (https://github.com/ogham/dog)
    qrencode # encoding data in a QR Code symbol
    nurl # CLI tool to generate Nix fetcher calls from repository URLs
    file # a program that shows the type of files
    dnsutils # domain name server (nslookup)
    pastel # a CLI tool to generate, analyze, convert and manipulate colors
    bitwise # terminal based bitwise calculator
    grex # a CLI tool for generating regular expressions from user-provided test cases
    fdupes # identifies duplicate files residing within specified directories
    kalker # command line calculator
    license-generator # CLI tool for generating license files
    nix-output-monitor # processes output of Nix commands to show helpful and pretty information
    nvd # Nix/NixOS package version diff tool
    nh # Yet another nix CLI helper
    piper # GTK frontend for ratbagd mouse config daemon
    trash-cli # CLI to the freedesktop.org trashcan
    android-tools # Android SDK platform tools
    qpdf # manipulate the structure of PDF files
    lnav # Logfile Navigator
    pdfgrep # CLI tool to search text in PDF files
    autojump # `cd` command that learns
    lsd # next gen `ls` command
    qalculate-gtk # desktop calculator
    onefetch # CLI git information tool
    rpi-imager # Raspberry Pi Imaging Utility
    mermaid-cli # generation of diagrams from text (`mmdc` command)
    sublime3 # text editor
    ipcalc # simple IP network calculator
  ];
}
