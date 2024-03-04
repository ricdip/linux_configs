{ pkgs, ... }:

{
  home.packages = with pkgs; [
    e2fsprogs
    btrfs-progs
    exfatprogs
    dosfstools
    ntfs3g
    parted
    gparted
  ];
}
