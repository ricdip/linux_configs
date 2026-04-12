{ self, inputs, ... }: {
  flake.nixosConfigurations.s56cb = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.s56cbConfiguration
    ];
  };
}