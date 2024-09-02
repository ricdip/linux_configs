{
  # auto scrub
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  services.snapper = {
    # snapshot interval: format https://www.freedesktop.org/software/systemd/man/latest/systemd.time.html
    snapshotInterval = "hourly";
    # cleanup interval: format https://www.freedesktop.org/software/systemd/man/latest/systemd.time.html
    cleanupInterval = "1d";
    configs = {
      # remember to create subvolume /home/.snapshots (`sudo btrfs subvolume create /home/.snapshots`)
      home = {
        # path of the subvolume or mount point
        SUBVOLUME = "/home";
        # defines whether hourly snapshots should be created
        TIMELINE_CREATE = true;
        # defines whether the timeline cleanup algorithm should be run for the config
        TIMELINE_CLEANUP = true;
        # limits for timeline cleanup
        TIMELINE_LIMIT_HOURLY = "5";
        TIMELINE_LIMIT_DAILY = "2";
        TIMELINE_LIMIT_WEEKLY = "1";
        TIMELINE_LIMIT_MONTHLY = "0";
        TIMELINE_LIMIT_YEARLY = "0";
      };
    };
  };
}
