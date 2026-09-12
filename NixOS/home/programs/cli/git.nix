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
      commit.gpgsign = false;
    };
  };
  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };
}
