{ config, pkgs, constants, ... }:

{
  # user accounts
  # TODO: set password with passwd or use hashedPassword
  users.users.${constants.user.name} = {
    isNormalUser = true;
    description = constants.user.description;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    # programs.zsh.enable is already managed by Home Manager
    ignoreShellProgramCheck = true;
    # create it with mkpasswd
    # hashedPassword = "";
  };
}
