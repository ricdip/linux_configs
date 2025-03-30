{ pkgs, ... }:
/*
  let
    gpartedPolkitId = "org.gnome.gparted";
    gpartedPolkitAction = pkgs.stdenv.mkDerivation {
      name = "gparted-polkit-action";
      src = "./.";
      dontUnpack = true;
      dontCreateSymlink = true;
      phases = [
        "buildPhase"
        "installPhase"
      ];
      buildPhase = ''
        cat > ${gpartedPolkitId} << EOF
        <?xml version="1.0" encoding="UTF-8"?>
          <!DOCTYPE policyconfig PUBLIC "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN" "http://www.freedesktop.org/standards/PolicyKit/1.0/policyconfig.dtd">
          <policyconfig>
            <action id="${gpartedPolkitId}">
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
        cp -r ${gpartedPolkitId} $out/share/polkit-1/actions
      '';
    };
  in
*/
{
  environment.systemPackages = [
    pkgs.gparted # graphical disk partitioning tool
    # gpartedPolkitAction
  ];
}
