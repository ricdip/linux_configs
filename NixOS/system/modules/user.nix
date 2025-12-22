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
    # packages installed for user not managed by Home Manager
    packages = with pkgs; [
      home-manager # a Nix-based user environment configurator
      lm_sensors # tools for reading hardware sensors (`sensors` command)
      inotify-tools # simple interface to inotify
      vulkan-tools # Khronos official Vulkan Tools and Utilities (`vulkan-info`, `vkcube` commands)
      glxinfo # test utilities for OpenGL (`glxgears`, `glxinfo` commands)
      intel-gpu-tools # tools for development and testing of the Intel DRM driver (`intel_gpu_top` command)
      nvtopPackages.full # a (h)top like task monitor for AMD, Adreno, Intel and NVIDIA GPUs (`nvtop` command)
      cron # daemon for running commands at specific times
      polkit_gnome # a dbus session bus service that is used to bring up authentication dialogs
    ];
  };
}
