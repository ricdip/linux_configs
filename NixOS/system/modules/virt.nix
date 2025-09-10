{ pkgs, consts, ... }:
{
  # VMs with libvirtd and qemu
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };
  programs.virt-manager.enable = true;

  # VMs with quickemu
  environment.systemPackages = with pkgs; [
    quickemu # quickly create and run optimised Windows, macOS and Linux virtual machines
  ];

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
