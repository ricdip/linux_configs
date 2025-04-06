{ consts, config, ... }:
{
  programs.git = {
    enable = true;
    userName = consts.user.name;
    userEmail = config.sops.secrets."user/email".path;
    extraConfig = {
      init.defaultBranch = "master";
      # sign all commits with gpg key
      commit.gpgsign = true;
      user.signingkey = config.sops.secrets."user/git/gpg_signing_key".path;
    };
    diff-so-fancy = {
      enable = true;
    };
  };
}
