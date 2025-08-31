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
  /*
    services.resolved = {
      enable = true;
      fallbackDns = consts.networking.nameservers;
    };
  */

  # user groups update
  users.users.${consts.user.name}.extraGroups = [ "networkmanager" ];

  # configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
