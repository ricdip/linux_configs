{ consts, ... }:
{
  networking = {
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = consts.networking.nameservers;

    # firewall configuration
    # open ports in the firewall
    networking.firewall.allowedTCPPorts = consts.networking.firewall.allowedTCPPorts;
    networking.firewall.allowedUDPPorts = consts.networking.firewall.allowedUDPPorts;
    firewall.enable = true;
  };

  # user groups update
  consts.user.groups = [ "networkmanager" ];

  # configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
