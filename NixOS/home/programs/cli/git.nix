{ pkgs, consts, ... }:
{
  programs.git = {
    enable = true;
    userName = consts.user.name;
    userEmail = consts.user.email;
    extraConfig = {
      init.defaultBranch = "master";
      # sign all commits with gpg key
      commit.gpgsign = true;
      user.signingkey = "86FA511B24D51753";
    };
    diff-so-fancy = {
      enable = true;
    };
  };
}
