{ pkgs, ... }:

{
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
}
