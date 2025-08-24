{ pkgs, consts, ... }:
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
      extraFiles = {
        "EFI/memtest86/BOOTX64.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi";
      };
      # TODO: be careful: the memtest86 menuentry has the hardcoded EFI partition UUID!
      # Remember to update it if it changes
      extraEntries = ''
        menuentry "Shut down" {
          echo "Powering off machine..."
          halt
        }

        menuentry "Reboot" {
          echo "Rebooting machine..."
          reboot
        }

        if [ "$grub_platform" = "efi" ]; then
          menuentry "UEFI Firmware Settings" --id "uefi-firmware" {
            echo "Booting UEFI Firmware Settings..."
            fwsetup
          }

          menuentry "UEFI MemTest86" {
            echo "Booting UEFI MemTest86..."
            search --no-floppy --fs-uuid --set=root ${consts.disks.partitions-uuid.efi}
            insmod chain
            chainloader /EFI/memtest86/BOOTX64.efi
          }
        fi
      '';
    };
    timeout = 10;
  };
}
