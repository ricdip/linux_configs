{
  services.logind.settings.Login = {
    HandlePowerKey = "poweroff";
    HandleRebootKey = "reboot";
    HandleSuspendKey = "ignore";
    HandleHibernateKey = "ignore";
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore"; # con dock
    HandleLidSwitchExternalPower = "ignore"; # con alimentatore collegato
  };
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
