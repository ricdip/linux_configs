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
}
