{ pkgs, ... }:

{
  home.packages = with pkgs; [ nnn ];

  programs.nnn = {
    enable = true;
    package = pkgs.nnn.override ({ withNerdIcons = true; });
    extraPackages = with pkgs; [ ffmpegthumbnailer mediainfo sxiv ];
    plugins = {
      mappings = {
        c = "fzcd";
        f = "finder";
        v = "imgview";
      };
      src = (pkgs.fetchFromGitHub {
        owner = "jarun";
        repo = "nnn";
        rev = "v4.0";
        sha256 = "sha256-Hpc8YaJeAzJoEi7aJ6DntH2VLkoR6ToP6tPYn3llR7k=";
      }) + "/plugins";
    };
  };
}
