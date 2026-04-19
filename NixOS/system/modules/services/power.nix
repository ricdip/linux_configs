{
  services.upower = {
    enable = true;
  };
  services.logind.settings.Login = {
    HandlePowerKey = "poweroff";
    HandleRebootKey = "reboot";
    HandleSuspendKey = "ignore";
    HandleHibernateKey = "ignore";
    HandleLidSwitch = "ignore";
    HandleLidSwitchDocked = "ignore"; # with dock
    HandleLidSwitchExternalPower = "ignore"; # with connected external power
  };
}
