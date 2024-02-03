# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # import hardware definition
      # TODO: put file hardware-configuration.nix in this directory
      ./hardware-configuration.nix
    ];

  # bootloader: grub configuration
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      device = "/dev/sda";
      efiSupport = true;
      useOSProber = true;
      #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
    };
  };

  # hostname
  networking.hostName = "nixos-test";
  
  # network
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = "Europe/Rome";

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # locale
  i18n.defaultLocale = "it_IT.UTF-8";

  # user accounts
  # TODO: set password with passwd or use hashedPassword
  users.users.ricdip = {
    isNormalUser = true;
    description = "Riccardo Armando Di Prinzio";
    shell = "zsh";
    extraGroups = [ "wheel" ];
    # hashedPassword = ""; # create it with mkpasswd
  };

  # packages installed in system profile
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];

  # nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

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