{ pkgs, ... }:
{
  # enable CUPS to print documents
  services.printing = {
    enable = true;
    startWhenNeeded = true;
    # enable the CUPS web UI at http://localhost:631
    webInterface = true;
    listenAddresses = [ "localhost:631" ];
    # specifies whether shared printers are advertised
    browsing = false;
    # specifies CUPS drivers to use
    drivers = with pkgs; [ cups-brother-hl1110 ];
  };

  /*
    services.avahi = {
      enable = true;
      nssmdns4 = true; # allow hostname resolution via .local
      openFirewall = true; # allow local network discovery
    };
  */
}
