{ inputs, ... }:
{
  # https://docs.noctalia.dev/getting-started/nixos/

  # import the noctalia home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;

    # generate noctalia settings: nix run nixpkgs#noctalia-shell ipc call state all > ./noctalia-settings.json
    settings = (builtins.fromJSON (builtins.readFile ./noctalia-settings.json)).settings;

    # installed plugins
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        "custom-commands" = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        "keybind-cheatsheet" = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        "privacy-indicator" = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };
  };
}
