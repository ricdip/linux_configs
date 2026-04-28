{
  description = "ricdip nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-index-database,
      noctalia,
      nvf,
    }@inputs:
    let
      consts = import ./consts.nix;
    in
    {
      nixosConfigurations = {
        ${consts.system.hostname} = nixpkgs.lib.nixosSystem {
          system = consts.system.platform;
          specialArgs = {
            inherit consts;
            inherit inputs;
          };
          modules = [
            ./system/configuration.nix
            nix-index-database.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit consts;
                inherit inputs;
              };
              home-manager.users.${consts.user.name} = import ./home;
            }
          ];
        };
      };
    };
}
