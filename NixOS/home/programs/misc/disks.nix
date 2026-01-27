{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # partitioning
    e2fsprogs # utilities for ext2/ext3/ext4 filesystems
    btrfs-progs # utilities for the btrfs filesystem
    exfatprogs # utilities for exFAT filesystem
    dosfstools # utilities for FAT and VFAT filesystems
    ntfs3g # FUSE-based NTFS driver with full write support
    parted # create, destroy, resize, check, and copy partitions
    gptfdisk # partitioning tools for Globally Unique Identifier (GUID) Partition Table (GPT) disks
    zfs # ZFS Filesystem Linux Userspace Tools
    # misc
    cryptsetup # LUKS
    # veracrypt # free open source filesystem on-the-fly encryption
    mdadm # managing RAID arrays under Linux
    testdisk # data recovery utilities (`testdisk` and `photorec` commands)
    smartmontools # tools for monitoring the health of hard drives
    # ventoy-full # a new bootable USB solution (removed because is marked as insecure)
    nwipe # securely erase disks
    hdparm # tool to get/set ATA/SATA drive parameters under Linux
    grub2_efi # GNU GRUB EFI
    ncdu # disk usage analyzer
  ];
}
