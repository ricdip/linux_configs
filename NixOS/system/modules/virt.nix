{ pkgs, consts, ... }:
{
  # VMs with libvirtd and qemu
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };
  programs.virt-manager.enable = true;

  # VMs with quickemu and distrobox
  environment.systemPackages = with pkgs; [
    quickemu # quickly create and run optimised Windows, macOS and Linux virtual machines
    distrobox # wrapper around podman or docker to create and start containers
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
