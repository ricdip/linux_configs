{ pkgs, consts, ... }:
{
  # VMs
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
    };
  };
  programs.virt-manager.enable = true;

  # containers
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    package = pkgs.docker;
    storageDriver = "btrfs";
  };

  # user groups update
  consts.user.groups = [
    "libvirtd"
    "docker"
  ];
}
