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
    firewall.enable = true;
    # open ports in the firewall
    firewall.allowedTCPPorts = consts.networking.firewall.allowedTCPPorts;
    firewall.allowedUDPPorts = consts.networking.firewall.allowedUDPPorts;
  };

  # user groups update
  users.users.${consts.user.name}.extraGroups = [ "networkmanager" ];

  # configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
