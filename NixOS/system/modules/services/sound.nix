{ pkgs, ... }:
{
  # enable sound
  # whether to enable the RealtimeKit system service
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    # ALSA support
    alsa.enable = true;
    alsa.support32Bit = true;
    # PulseAudio compatibility
    pulse.enable = true;
    # JACK support
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol # PulseAudio Volume Control
  ];
}
