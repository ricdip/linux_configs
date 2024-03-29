{
  # network
  networking.networkmanager.enable = true;

  ## firewall
  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ 22 ];

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
