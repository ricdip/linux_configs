{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lutris # open source gaming platform for GNU/Linux
    mangohud # a Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more
  ];
}
