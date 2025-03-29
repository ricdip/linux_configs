{ pkgs, ... }:
let
  polkitCustomFiles = pkgs.stdenv.mkDerivation {
    name = "polkitCustomFiles";
    src = "./.";
    dontUnpack = true;
    phases = [
      "buildPhase"
      "installPhase"
    ];
    buildPhase = ''
      cat > org.freedesktop.gparted.policy << EOF
      <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN" "http://www.freedesktop.org/standards/PolicyKit/1.0/policyconfig.dtd">
        <policyconfig>
          <action id="org.freedesktop.gparted.policy"> 
            <message>Authentication is required to run the GParted Partition Editor</message>
            <icon_name>gparted</icon_name>
            <defaults> 
              <allow_any>auth_admin</allow_any>
              <allow_inactive>auth_admin</allow_inactive>
              <allow_active>auth_admin</allow_active>
            </defaults>
            <annotate 
              key="org.freedesktop.policykit.exec.path">${pkgs.gparted}/bin/gparted</annotate>
            <annotate 
              key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
          </action>
        </policyconfig>
      EOF
    '';
    installPhase = ''
      mkdir -p $out/share/polkit-1/actions
      cp -r org.freedesktop.gparted.policy $out/share/polkit-1/actions
    '';
    dontCreateSymlink = true;
  };
in
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

  environment.systemPackages = [
    polkitCustomFiles
  ];

  # start authentication agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      enable = true;
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
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
