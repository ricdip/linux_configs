{ consts, config, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = config.sops.secrets.networking.nameservers;

    # firewall configuration
    firewall.enable = true;
    # open ports in the firewall
    firewall.allowedTCPPorts = config.sops.secrets.networking.firewall.allowed_tcp_ports;
    firewall.allowedUDPPorts = config.sops.secrets.networking.firewall.allowed_udp_ports;
  };

  # user groups update
  users.users.${consts.user.name}.extraGroups = [ "networkmanager" ];

  # configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
