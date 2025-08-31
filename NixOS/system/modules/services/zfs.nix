{
  /*
    boot.zfs = {
      devNodes = "/dev/disk/by-partuuid";
      allowHibernation = false;
    };
    services.zfs = {
      # run automatic scrubbing of ZFS pools
      autoScrub = {
        enable = true;
        interval = "monthly";
      };
      # run trim automatically (only SSD supports it, HDD will ignore the command)
      trim = {
        enable = true;
        interval = "weekly";
      };
      autoSnapshot.enable = false;
      autoReplication.enable = false;
    };
    # additional configuration to be appended to the generated modprobe.conf:
    # - zfs_arc_max = 2GB
    # - zfs_arc_min = 512MB
    boot.extraModprobeConfig = ''
      options zfs zfs_arc_max=2147483648 zfs_arc_min=536870912
    '';
  */
}
