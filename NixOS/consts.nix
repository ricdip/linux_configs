{
  user = {
    name = "ricdip";
    email = "riccardodpr@gmail.com";
    git = {
      signingkey = "86FA511B24D51753";
    };
  };
  # path relative to home directory
  flake = "linux_configs/NixOS";
  system = {
    hostname = "nixos";
    platform = "x86_64-linux";
    locale = "it_IT.UTF-8";
    timezone = "Europe/Rome";
    smartd = {
      enable = true;
      hdd = "/dev/disk/by-id/ata-HGST_HTS541075A9E680_JD11001V05WBZM";
      ssd = "/dev/disk/by-id/ata-KINGSTON_SMSM150S324G_50026B723109DF0A";
    };
  };
  applications = {
    docker = {
      storageDriver = "btrfs";
    };
  };
  hardware = {
    graphics = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  networking = {
    # 32-bit host ID of the machine, formatted as 8 hexadecimal characters:
    # - head -c 8 /etc/machine-id
    # - head -c4 /dev/urandom | od -A none -t x4
    hostId = "a9779b26";
    firewall = {
      # open ports in the firewall
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };
    nameserver = {
      # pihole DNS
      defaults = [
        "192.168.8.245"
      ];
      # Cloudflare DNS
      fallback = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
  };
  disks = {
    partitions-uuid = {
      efi = "3B0C-4580";
    };
  };
}
