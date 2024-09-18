{ pkgs, ... }:
{
  # enable CUPS to print documents
  services.printing = {
    enable = true;
    startWhenNeeded = true;
    drivers = with pkgs; [ cups-brother-hl1110 ];
  };
}
