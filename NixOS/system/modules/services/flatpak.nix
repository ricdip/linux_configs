{
  # https://flatpak.org/setup/NixOS

  # enable flatpak: used for apps that are difficult to use in Nix
  services.flatpak.enable = true;

  # apps:
  # - Ungoogled Chromium [installed]
  # - IntelliJ IDEA Open (IntelliJ Community) [not installed]
  # - Android Studio [not installed]
}
