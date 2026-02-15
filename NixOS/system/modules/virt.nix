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

  # VMs with VirtualBox
  virtualisation.virtualbox = {
    host = {
      enable = true;
      # enableExtensionPack = true;
      # enableKvm = true;
      # addNetworkInterface = false;
    };
    guest = {
      enable = true;
      dragAndDrop = true;
      vboxsf = false;
    };
  };

  # wine and VMs with quickemu and distrobox
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable # open Source implementation of the Windows API on top of X, OpenGL, and Unix
    winetricks # script to install DLLs needed to work around problems in Wine
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
    "vboxusers"
  ];
}
