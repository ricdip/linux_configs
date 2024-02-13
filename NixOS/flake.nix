let
  config = {
    userName = "ricdip";
    userDescription = "Riccardo Armando Di Prinzio";
  };
in {
  description = "NixOS configuration of ricdip";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      # host list (<hostname> = nixpkgs.lib.nixosSystem { ... })
      nixos-test = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # host nixos-test config
          ./hosts/nixos-test
          {
            inherit config;
          }

          # home nixos-test config
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs config; };
            home-manager.users.ricdip = import ./home;
          }
        ];
      };
    };
  };
}
