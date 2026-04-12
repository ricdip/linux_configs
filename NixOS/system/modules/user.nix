{ pkgs, consts, ... }:
{
  # define a user account: set a password with ‘passwd’ command
  users.users.${consts.user.name} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "input"
    ];
    # programs.zsh.enable is already managed by Home Manager
    ignoreShellProgramCheck = true;
  };
}
