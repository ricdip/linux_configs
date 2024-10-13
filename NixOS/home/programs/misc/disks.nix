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
    gparted # graphical disk partitioning tool
    # misc
    cryptsetup # LUKS
    # veracrypt # free Open-Source filesystem on-the-fly encryption
    mdadm # managing RAID arrays under Linux
    testdisk # data recovery utilities
    smartmontools # tools for monitoring the health of hard drives
    ventoy-full # a new bootable USB solution
    nwipe # securely erase disks
  ];
}
