{ pkgs, ... }:
{
  services.gammastep = {
    enable = true;
    package = pkgs.gammastep;
    duskTime = "18:35-20:15";
    dawnTime = "6:00-7:45";
    provider = "manual";
    latitude = 42.48;
    longitude = 14.14;
    temperature = {
      day = 5500;
      night = 2500;
    };
    settings = {
      general = {
        adjustment-method = "wayland";
      };
    };
  };
}
