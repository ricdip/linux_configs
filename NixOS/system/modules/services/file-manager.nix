{ pkgs, ... }:

{
  # thunar file manager
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  # common dependencies
  # mount, trash, and other functionalities
  services.gvfs.enable = true;

  # thumbnail support for images
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    # common packages
    ffmpegthumbnailer # lightweight video thumbnailer
    poppler # PDF rendering library
    freetype # font rendering engine
    xarchiver # GTK frontend to 7z,zip,rar,tar,bzip2, gzip,arj, lha, rpm and deb (open and extract only)

    # nautilus file manager packages
    nautilus # file manager for GNOME
    file-roller # archive manager for the GNOME desktop environment (nautilus integration)
    nautilus-open-any-terminal # extension for nautilus, which adds an context-entry for opening other terminal-emulators than `gnome-terminal`
    sushi # quick previewer for Nautilus
  ];
}
