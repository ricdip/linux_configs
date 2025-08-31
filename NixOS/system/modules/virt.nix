{ pkgs, consts, ... }:
{
  # VMs
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };
  programs.virt-manager.enable = true;

  # containers
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    package = pkgs.docker;
    storageDriver = consts.applications.docker.storageDriver;
  };

  # user groups update
  users.users.${consts.user.name}.extraGroups = [
    "libvirtd"
    "docker"
  ];
}
