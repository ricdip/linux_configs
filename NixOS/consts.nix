{
  user = {
    name = "ricdip";
    email = "riccardodpr@gmail.com";
  };
  flake = "linux_configs/NixOS"; # path relative to home directory
  system = {
    hostname = "nixos";
    platform = "x86_64-linux";
  };
}
