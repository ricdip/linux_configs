{ pkgs, ... }:
{
  # using tuigreet as login manager
  services.greetd = {
    enable = true;
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
}
