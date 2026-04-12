{ self, inputs, ... }: {
  flake.nixosModules.s56cbConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.s56cbHardware
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    environment.systemPackages = with pkgs; [
      firefox
      vim
    ];
  };
}