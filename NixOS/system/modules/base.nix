{ pkgs, consts, ... }:
{
  # define hostname
  networking.hostName = consts.system.hostname;

  # set time zone
  time.timeZone = "Europe/Rome";

  # add supported filesystem types
  boot.supportedFilesystems = [ "ntfs" ];

  # select internationalisation properties
  i18n.defaultLocale = "it_IT.UTF-8";
  # select console properties
  console = {
    earlySetup = true;
    font = "ter-v16b";
    packages = with pkgs; [ terminus_font ];
    keyMap = "it";
  };

  # GNOME configuration database
  programs.dconf.enable = true;

  # enable udisks2, a DBus service that allows applications to query and manipulate storage devices (`udisksctl` command)
  services.udisks2.enable = true;

  # enable fwupd, a DBus service that allows applications to update firmware (`fwupdmgr` command)
  services.fwupd.enable = true;

  # packages installed in system profile
  environment.systemPackages = with pkgs; [
    vim # text editor
    wget # tool for retrieving files using HTTP, HTTPS, and FTP
    curl # a command line tool for transferring files with URL syntax
    sysstat # a collection of performance monitoring tools for Linux
    ethtool # utility for controlling network drivers and hardware
    pciutils # a collection of programs for inspecting and manipulating configuration of PCI devices (`lspci` command)
    usbutils # tools for working with USB devices (`lsusb` command)
    lshw # provide detailed information on the hardware configuration of the machine
    psmisc # utilities that use the proc filesystem
    lsof # a tool to list open files
    # udisks # daemon, tools and libraries to access and manipulate disks (`udisksctl` command)
  ];

  # a list of permissible login shells for user accounts.
  # No need to mention /bin/sh here, it is placed into this list implicitly
  environment.shells = with pkgs; [ fish ];
}
