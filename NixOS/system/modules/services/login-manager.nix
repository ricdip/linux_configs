{ pkgs, ... }:
{
  # using tuigreet as login manager
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --user-menu --cmd sway
        '';
        user = "greeter";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
  '';
}
