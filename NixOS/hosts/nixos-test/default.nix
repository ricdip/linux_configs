# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, constants, ... }:

{
  imports = [
    ../../modules/basic.nix
    ../../modules/bootloader.nix
    ../../modules/docker.nix
    ../../modules/fonts.nix
    ../../modules/fstools.nix
    ../../modules/i3.nix
    ../../modules/users.nix
    ../../modules/virt.nix

    # import hardware definition
    # TODO: put file hardware-configuration.nix in this directory (generated with nixos-generate-config)
    ./hardware-configuration.nix
  ];

  # allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # packages installed in system profile
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    gnupg
    sysstat
    lm_sensors
    docker
    qemu
  ];

  # hostname
  networking.hostName = "nixos-test";

  # virtualbox guest additions (NixOS as a guest OS)
  virtualisation.virtualbox.guest = {
    enable = true;
    x11 = true;
  };

  # nix settings
  nix.settings = { experimental-features = [ "nix-command" "flakes" ]; };

  # garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  # this value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken
  system.stateVersion = "23.11";
}
