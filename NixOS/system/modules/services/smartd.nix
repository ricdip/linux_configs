{ consts, ... }:
{
  services.smartd = {
    enable = consts.system.smartd.enable;
    autodetect = false;
    devices = [
      {
        device = consts.system.smartd.hdd;
        # -o enable/disable SMART automatic offline testing
        # -S enable/disable attribute autosave
        # -n standby,q: check device unless it is in sleep or standby mode, do not write log message
        # -s T/MM/DD/d/HH: run tests at scheduled times (S: short self test; L: long self test)
        options = ''
          -o on -S on -n standby,q -s (S/../(08|22)/./22|L/../(01|15)/./18)
        '';
      }
      {
        device = consts.system.smartd.ssd;
        options = ''
          -o on -S on -n standby,q -s (S/../(08|22)/./23|L/../(01|15)/./19)
        '';
      }
    ];
    notifications = {
      x11 = {
        enable = false;
        display = ":0";
      };
      test = true;
      mail.enable = false;
    };
  };
}
