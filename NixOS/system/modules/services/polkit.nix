{ pkgs, ... }:
{
  # A toolkit for defining and handling the policy that allows
  # unprivileged processes to speak to privileged processes
  security.polkit = {
    enable = true;
    debug = true;
    # package = pkgs.polkit_gnome;
    extraConfig = ''
      polkit.addRule(function(action, subject) {
        polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
      });
    '';
  };

  # start authentication agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      enable = true;
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical.target" ];
      wants = [ "graphical.target" ];
      after = [ "graphical.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
