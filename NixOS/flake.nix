{
  description = "NixOS configuration of ricdip";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let constants = import ./constants.nix;
    in {
      nixosConfigurations = {
        # host list (<hostname> = nixpkgs.lib.nixosSystem { ... })
        nixos-test = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit constants; };
          modules = [
            # host nixos-test config
            ./hosts/nixos-test

            # home nixos-test config
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit constants; };
              home-manager.users.${constants.user.name} = import ./home;
            }
          ];
        };
      };
    };
}
