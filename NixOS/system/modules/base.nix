{ pkgs, consts, ... }:
let
  defaultLocale = consts.system.locale;
in
{
  # define hostname
  networking.hostName = consts.system.hostname;

  # set time zone
  time.timeZone = consts.system.timezone;

  # add supported filesystem types
  boot.supportedFilesystems = [
    "ntfs"
    "ext4"
    "vfat"
    "exfat"
    "btrfs"
    "zfs"
    "xfs"
  ];

  # select internationalisation properties
  i18n = {
    defaultLocale = defaultLocale;
    extraLocaleSettings = {
      LC_ADDRESS = defaultLocale;
      LC_IDENTIFICATION = defaultLocale;
      LC_MEASUREMENT = defaultLocale;
      LC_MONETARY = defaultLocale;
      LC_NAME = defaultLocale;
      LC_NUMERIC = defaultLocale;
      LC_PAPER = defaultLocale;
      LC_TELEPHONE = defaultLocale;
      LC_TIME = defaultLocale;
      LC_CTYPE = defaultLocale;
      LC_ALL = defaultLocale;
    };
  };
  # select console properties
  console = {
    earlySetup = true;
    font = "ter-v16b";
    packages = with pkgs; [ terminus_font ];
    useXkbConfig = true;
  };

  # GNOME configuration database
  programs.dconf.enable = true;

  # enable udisks2, a DBus service that allows applications to query and manipulate storage devices (`udisksctl` command)
  services.udisks2.enable = true;

  # enable fwupd, a DBus service that allows applications to update firmware (`fwupdmgr` command)
  services.fwupd.enable = true;

  # Whether to enable GNOME Keyring daemon, a service designed to take care of the user’s security credentials, such as user names and passwords
  services.gnome.gnome-keyring.enable = false;

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
    memtest86-efi # a tool to detect memory errors (runs from the bootloader)
    adw-gtk3 # theme from libadwaita ported to GTK-3
    adwaita-qt # style to bend Qt applications to look like they belong into GNOME Shell
    man-pages # Linux development manual pages
    hardinfo2 # system information and benchmarks for Linux systems
    dmidecode # tool that reads information about system's hardware from the BIOS according to the SMBIOS/DMI standard
    cpu-x # free software that gathers information on CPU, motherboard and more
  ];

  # man documentation config
  documentation = {
    nixos.includeAllModules = true;
    man.generateCaches = true;
    dev.enable = true;
  };

  # a list of permissible login shells for user accounts.
  # No need to mention /bin/sh here, it is placed into this list implicitly
  environment.shells = with pkgs; [ fish ];
}
