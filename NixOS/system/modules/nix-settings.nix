{ inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
      warn-dirty = false;
    };

    # automatic cleanup
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };

    nixPath = [
      "nixpkgs=${inputs.nixpkgs}"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    # workaround for https://github.com/nix-community/home-manager/issues/2942
    allowUnfreePredicate = _: true;
    # required by nvidia driver
    nvidia.acceptLicense = true;
  };

  programs.nix-index = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
  };

  # automatic update
  system = {
    autoUpgrade = {
      enable = false;
      # dates = "weekly";
    };
  };
}
