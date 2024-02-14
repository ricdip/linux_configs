{ config, pkgs, vars, ... }:

{
  # user accounts
  # TODO: set password with passwd or use hashedPassword
  users.users.${vars.userName} = {
    isNormalUser = true;
    description = vars.userDescription;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    # programs.zsh.enable is already managed by Home Manager
    ignoreShellProgramCheck = true;
    # create it with mkpasswd
    # hashedPassword = "";
  };
}
