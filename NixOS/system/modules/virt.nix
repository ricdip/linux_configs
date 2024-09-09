{ pkgs, ... }:
{
  # VMs
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # containers
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    package = pkgs.docker;
    storageDriver = "btrfs";
  };
}
