{
  # hostname
  networking.hostName = "nixos-test";

  # network
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = "Europe/Rome";

  # sound (pipewire): https://nixos.wiki/wiki/PipeWire
  sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # locale
  i18n.defaultLocale = "it_IT.UTF-8";
}
