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
    # other tools
    cryptsetup # LUKS
    mdadm # managing RAID arrays under Linux
    smartmontools # monitoring the health of hard drives
    testdisk # data recovery utilities
  ];
}
