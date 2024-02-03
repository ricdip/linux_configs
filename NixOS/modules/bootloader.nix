{ pkgs, ... }:

{
  # bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # efiSysMountPoint = "/boot/efi";
    };
    systemd-boot = { enable = true; };
    #grub = {
    #  enable = true;
    #  device = "/dev/sda";
    #  efiSupport = true;
    #  useOSProber = true;
    #  # in case canTouchEfiVariables doesn't work for your system
    #  #efiInstallAsRemovable = true;
    #};
  };
}