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

  environment.systemPackages = with pkgs; [
    polkit_gnome # a dbus session bus service that is used to bring up authentication dialogs (X11)
    # lxqt.lxqt-policykit # LXQt PolicyKit agent (Wayland)
  ];

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        # configures the mechanism via which the service notifies the manager that the service start-up has finished
        Type = "simple";
        # commands that are executed when this service is started
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        # configures whether the service shall be restarted when the service process exits
        Restart = "on-failure";
        # configures the time to sleep before restarting a service
        RestartSec = 5;
        # configures the time to wait for the service itself to stop. If it does not terminate in the specified time, it will be forcibly terminated by SIGKILL
        TimeoutStopSec = 20;
      };
    };
  };
}
