{
  config,
  consts,
  pkgs,
  ...
}:
{
  # enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  # blacklist drivers
  boot.blacklistedKernelModules = [
    "nouveau"
    "nvidiafb"
  ];

  hardware.nvidia = {
    # modesetting is required
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials
    powerManagement.enable = false;

    # fine-grained power management. Turns off GPU when not in use
    # experimental and only works on modern Nvidia GPUs (Turing or newer)
    powerManagement.finegrained = false;

    # use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # only available from driver 515.43.04+
    # currently alpha-quality/buggy, so false is currently the recommended setting
    open = false;

    # enable the Nvidia settings menu,
    # accessible via `nvidia-settings`
    nvidiaSettings = true;

    # select the appropriate driver version for specific GPU:
    # https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/
    # GeForce GT 740M -> 470.xx driver
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;

    # laptop Configuration: Hybrid Graphics (Nvidia Optimus PRIME)
    # (use both integrated GPU and discrete GPU)
    prime = {
      # Optimus PRIME Option A: Offload Mode
      # Offload mode puts the Nvidia GPU to sleep and lets the Intel GPU handle all tasks
      # except if you call the Nvidia GPU specifically by "offloading" an application to it
      # (by calling 'nvidia-offload <program>')
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # make sure to use the correct Bus ID values for the system
      # run 'sudo lshw -c display' to get correct Bus IDs
      ## integrated
      intelBusId = consts.hardware.graphics.intelBusId;
      ## dedicated
      nvidiaBusId = consts.hardware.graphics.nvidiaBusId;
    };
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools # Khronos official Vulkan Tools and Utilities (`vulkan-info`, `vkcube` commands)
    mesa-demos # collection of demos and test programs for OpenGL and Mesa (`glxgears`, `glxinfo` commands)
    intel-gpu-tools # tools for development and testing of the Intel DRM driver (`intel_gpu_top` command)
    # nvtopPackages.full # a (h)top like task monitor for AMD, Adreno, Intel and NVIDIA GPUs (`nvtop` command)
  ];
}
