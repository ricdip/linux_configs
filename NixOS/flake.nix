{
  description = "ricdip nixos configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-index-database,
      sops-nix,
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
            nix-index-database.nixosModules.nix-index
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
