{
  # OpenSSH daemon
  services.openssh = {
    enable = false;
    settings = {
      PermitRootLogin = "no";
    };
  };
}
