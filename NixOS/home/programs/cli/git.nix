{ consts, ... }:
{
  programs.git = {
    enable = true;
    userName = consts.user.name;
    userEmail = consts.user.email;
    extraConfig = {
      init.defaultBranch = "master";
      # sign all commits with gpg key
      commit.gpgsign = true;
      user.signingkey = consts.user.git.signingkey;
    };
    diff-so-fancy = {
      enable = true;
    };
  };
}
