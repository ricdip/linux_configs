{ pkgs, consts, ... }:
{
  # parameters added to the kernel command line:
  # - boot.shell_on_fail: allows for root shell if failure to boot. Requires root password
  boot.kernelParams = [ "boot.shell_on_fail" ];
  # GRUB EFI configuration
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
            search --file --set=root /EFI/memtest86/BOOTX64.efi
            insmod chain
            chainloader /EFI/memtest86/BOOTX64.efi
          }
        fi

        menuentry "SystemRescue 13.00 ISO (to RAM)" {
          insmod part_gpt
          insmod ext2
          insmod loopback
          echo "Booting SystemRescue ISO..."
          search --no-floppy --set=iso_fs --fs-uuid ${consts.partitions.live.uuid}
          set iso_file="/iso/${consts.partitions.live.isoName}"
          set archiso_param="img_dev=/dev/disk/by-uuid/${consts.partitions.live.uuid} img_loop=$iso_file"
          loopback loop ($iso_fs)$iso_file
          set root=(loop)
          linux /sysresccd/boot/x86_64/vmlinuz archisobasedir=sysresccd $archiso_param iomem=relaxed copytoram
          initrd /sysresccd/boot/intel_ucode.img /sysresccd/boot/amd_ucode.img /sysresccd/boot/x86_64/sysresccd.img
        }
      '';
    };
    timeout = 5;
  };
}
