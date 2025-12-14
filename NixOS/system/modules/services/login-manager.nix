{ pkgs, ... }:
{
  # using tuigreet as login manager
  services.greetd = {
    enable = true;
    vt = 7;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --user-menu --cmd sway
        '';
        user = "greeter";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
  '';

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # without this, errors will spam on screen
    # without these, bootlogs will spam on screen
    # TTYReset = true;
    # TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
