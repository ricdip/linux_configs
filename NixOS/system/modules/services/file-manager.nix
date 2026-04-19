{ pkgs, ... }:

{
  # thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
    ];
  };

  # preferences
  programs.xfconf.enable = true;

  # mount, trash, and other functionalities
  services.gvfs.enable = true;

  # thumbnail support for images
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer # lightweight video thumbnailer
    poppler # PDF rendering library
    freetype # font rendering engine
    xarchiver # GTK frontend to 7z,zip,rar,tar,bzip2, gzip,arj, lha, rpm and deb (open and extract only)
  ];
}
