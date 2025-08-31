{ pkgs, ... }:

{
  # thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
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
}
