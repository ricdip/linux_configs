{ inputs, ... }:
{
  # https://docs.noctalia.dev/getting-started/nixos/

  # import the noctalia home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia = {
    enable = true;

    # generate noctalia settings: nix run nixpkgs#noctalia-shell ipc call state all > ./noctalia-settings.json
    #settings = (builtins.fromJSON (builtins.readFile ./noctalia-settings.json)).settings;
  };
}
