{
  location = {
    provider = "manual";
    latitude = 42.48;
    longitude = 14.14;
  };
  services.redshift = {
    enable = true;
    temperature = {
      day = 5700;
      night = 2500;
    };
  };
}
