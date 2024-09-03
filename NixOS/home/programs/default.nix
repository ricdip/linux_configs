{ pkgs, ... }:

{
  imports = [
    ./cli
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
    # xdg-utils # a set of command line tools that assist applications with a variety of desktop integration tasks OR
    # handlr # a better xdg-utils
    bat # better cat
    glow # render markdown on the CLI
    figlet # program for making large letters out of ordinary text
    tldr # simplified and community-driven man pages
    scc # a very fast accurate code counter with complexity calculations
    duf # disk Usage/Free Utility
    # entr # run arbitrary commands when files change
    exiftool # a tool to read, write and edit EXIF meta information
    rsync # fast incremental file transfer utility
    tree # command to produce a depth indented directory listing
    # lazydocker # a simple terminal UI for both docker and docker-compose
    # lazygit # a simple terminal UI for git commands
    eza # better ls (https://github.com/ogham/exa)
    # aria # better wget
    hyperfine # command-line benchmarking tool (https://github.com/sharkdp/hyperfine)
    procs # better ps (https://github.com/dalance/procs)
    bandwhich # a CLI utility for displaying current network utilization (https://github.com/imsnif/bandwhich)
    # speedtest-cli # command line speed test utility (https://github.com/sivel/speedtest-cli)
    dogdns # command-line DNS client (https://github.com/ogham/dog)
    # navi # interactive cheat sheet
    imagemagick # create, edit, compose, or convert bitmap images
    qrencode # encoding data in a QR Code symbol
    nurl # CLI tool to generate Nix fetcher calls from repository URLs
    nixfmt-rfc-style # official formatter for Nix code
    file # a program that shows the type of files
    dnsutils # domain name server (nslookup)

    # system call monitoring
    # strace # a system call tracer for Linux
    # ltrace # library call tracer
    lsof # a tool to list open files

    # system tools
    sysstat # a collection of performance monitoring tools for Linux
    ethtool # utility for controlling network drivers and hardware
    pciutils # a collection of programs for inspecting and manipulating configuration of PCI devices (lspci)
    usbutils # tools for working with USB devices (lsusb)
    lshw # provide detailed information on the hardware configuration of the machine
    psmisc # utilities that use the proc filesystem

    trash-cli # CLI to the freedesktop.org trashcan
    android-tools # Android SDK platform tools
  ];
}
