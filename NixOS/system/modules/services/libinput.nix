{
  # enable touchpad support
  services.libinput = {
    enable = true;
    touchpad.disableWhileTyping = true;
  };
}
