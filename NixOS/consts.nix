{
  user = {
    name = "ricdip";
    email = "riccardodpr@gmail.com";
    git = {
      signingkey = "86FA511B24D51753";
    };
  };
  flake = "linux_configs/NixOS"; # path relative to home directory
  system = {
    hostname = "nixos";
    platform = "x86_64-linux";
    locale = "it_IT.UTF-8";
    consoleKeyMap = "it";
    timezone = "Europe/Rome";
    smartd = {
      enable = true;
      hdd = "/dev/disk/by-id/ata-HGST_HTS541075A9E680_JD11001V05WBZM";
      ssd = "/dev/disk/by-id/ata-KINGSTON_SMSM150S324G_50026B723109DF0A";
    };
  };
  hardware = {
    graphics = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  networking = {
    firewall = {
      # open ports in the firewall
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    # Cloudflare DNS
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };
}
