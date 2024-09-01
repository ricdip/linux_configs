{ pkgs, consts, ... }:
{
  # define hostname
  networking.hostName = consts.system.hostname;

  # set time zone
  time.timeZone = "Europe/Rome";

  # select internationalisation properties
  i18n.defaultLocale = "it_IT.UTF-8";
  # select console properties
  console = {
    earlySetup = true;
    font = "ter-v16b";
    packages = with pkgs; [ terminus_font ];
    keyMap = "it";
  };

  # enable CUPS to print documents
  # services.printing.enable = true;

  # GNOME configuration database
  programs.dconf.enable = true;

  # packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
  ];
}
