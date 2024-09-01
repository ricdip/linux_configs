{
  description = "Ricdip NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      consts = import ./consts.nix;
    in
    {
      nixosConfigurations = {
        ${consts.system.hostname} = nixpkgs.lib.nixosSystem {
          system = consts.system.platform;
          specialArgs = {
            inherit consts;
          };
          modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit consts;
              };
              home-manager.users.${consts.user.name} = import ./home;
            }
          ];
        };
      };
    };
}
