{ pkgs, ... }:

{
  # bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # mount it in hardware_configuration.nix
    };
    # systemd-boot = { enable = true; };
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };
}
