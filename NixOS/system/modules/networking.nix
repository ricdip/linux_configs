{ consts, lib, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      # dns = "none";
      dns = "systemd-resolved";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    # nameservers = consts.networking.nameserver.defaults;

    hostId = consts.networking.hostId;

    # firewall configuration
    firewall = {
      enable = true;
      allowPing = true;
      # open ports in the firewall
      allowedTCPPorts = consts.networking.firewall.allowedTCPPorts;
      allowedUDPPorts = consts.networking.firewall.allowedUDPPorts;
    };
  };

  # systemd DNS resolver configuration
  services.resolved = {
    enable = true;
    domains = [ "~." ];
    fallbackDns = consts.networking.nameserver.fallback;
    extraConfig = ''
      DNSStubListener=no
    '';
  };

  # user groups update
  users.users.${consts.user.name}.extraGroups = [ "networkmanager" ];

  # configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # set DNS fallbacks at startup
  systemd.services.set-dns-fallbacks = {
    enable = true;
    description = "Sets the DNS fallbacks";
    wantedBy = [ "NetworkManager.service" ];
    wants = [ "NetworkManager.service" ];
    after = [ "NetworkManager.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        resolvectl dns wlp3s0 ${lib.strings.concatStringsSep " " consts.networking.nameserver.fallback}
      '';
    };
  };
}
