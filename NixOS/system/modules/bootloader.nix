{
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      extraEntries = ''
        menuentry "Shut down" {
          halt
        }

        menuentry "Reboot" {
          reboot
        }

        menuentry 'UEFI Firmware Settings' --id 'uefi-firmware' {
          fwsetup
        }
      '';
    };
    timeout = 10;
  };
}
