{ pkgs, ... }:

{
  home.packages = with pkgs; [ zsh ];

  programs.zsh = {
    enable = true;
    # TODO: zsh config: https://nixos.wiki/wiki/Zsh
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "jump" "fd" ];
      theme = "fishy";
    };
  };
}
