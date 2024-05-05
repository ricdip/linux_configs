{ pkgs, constants, ... }:

{
  # user accounts
  # TODO: set password with passwd or use hashedPassword
  users.users.${constants.user.name} = {
    isNormalUser = true;
    description = constants.user.description;
    # TODO: user groups to module files
    extraGroups = [ "wheel" "libvirtd" ];
    shell = pkgs.fish;
    # programs.zsh.enable is already managed by Home Manager
    ignoreShellProgramCheck = true;
    # create it with mkpasswd
    # hashedPassword = "";
  };
}
