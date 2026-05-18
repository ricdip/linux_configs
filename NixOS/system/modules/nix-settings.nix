{ inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      auto-optimise-store = true;
      warn-dirty = false;
      # maximum number of concurrent tasks during one build. It affects, e.g., -j option for make. The special value 0 means that the builder should use all available CPU cores in the system. Some builds may become non-deterministic with this option; use with care! Packages will only be affected if enableParallelBuilding is set for them.
      cores = 0;
      # maximum number of jobs that Nix will try to build in parallel. The default is auto, which means it will use all available logical cores. It is recommend to set it to the total number of logical cores in your system (e.g., 16 for two CPUs with 4 cores each and hyper-threading).
      max-jobs = "auto";
    };

    # automatic cleanup
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
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
