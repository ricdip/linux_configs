{ pkgs, ... }:
{
  # thunar
  programs.thunar = {
    enable = true;
  };

  programs.xfconf.enable = true; # preferences

  services.gvfs.enable = true; # mount, trash, and other functionalities

  services.tumbler.enable = true; # thumbnail support for images
}
