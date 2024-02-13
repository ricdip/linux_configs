{ config, pkgs, ... }:

{
  # user accounts
  # TODO: set password with passwd or use hashedPassword
  users.users.${config.userName} = {
    isNormalUser = true;
    description = config.userDescription;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    # programs.zsh.enable is already managed by Home Manager
    ignoreShellProgramCheck = true;
    # create it with mkpasswd
    # hashedPassword = "";
  };
}
