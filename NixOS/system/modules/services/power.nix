{
  services.logind.settings.Login = {
    HandlePowerKey = "poweroff";
    HandleRebootKey = "reboot";
    HandleSuspendKey = "ignore";
    HandleHibernateKey = "ignore";
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore"; # with dock
    HandleLidSwitchExternalPower = "ignore"; # with connected external power
  };
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
}
