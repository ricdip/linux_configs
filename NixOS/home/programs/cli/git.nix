{ consts, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = consts.user.name;
        email = consts.user.email;
      };
      init.defaultBranch = "master";
      # sign all commits with gpg key
      commit.gpgsign = true;
      user.signingkey = consts.user.git.signingkey;
    };
  };
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };
}
