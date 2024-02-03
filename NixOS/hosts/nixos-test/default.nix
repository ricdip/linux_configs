# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # import hardware definition
    # TODO: put file hardware-configuration.nix in this directory (generated with nixos-generate-config)
    ./hardware-configuration.nix
  ];

  # bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      # efiSysMountPoint = "/boot/efi";
    };
    systemd-boot = { enable = true; };
    #grub = {
    #  enable = true;
    #  device = "/dev/sda";
    #  efiSupport = true;
    #  useOSProber = true;
    #  # in case canTouchEfiVariables doesn't work for your system
    #  #efiInstallAsRemovable = true;
    #};
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

  # fonts
  fonts.packages = with pkgs; [
    # icon fonts
    material-design-icons
    # normal fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    # nerdfonts: only a subset
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  # user accounts
  # TODO: set password with passwd or use hashedPassword
  users.users.ricdip = {
    isNormalUser = true;
    description = "Riccardo Armando Di Prinzio";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    # programs.zsh.enable is already managed by Home Manager
    ignoreShellProgramCheck = true;
    # create it with mkpasswd
    # hashedPassword = "";
  };

  # packages installed in system profile
  environment.systemPackages = with pkgs; [ vim wget curl git ];

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
