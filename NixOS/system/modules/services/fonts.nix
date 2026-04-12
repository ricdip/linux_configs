{ pkgs, ... }:
{
  # fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome
      # noto fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      # terminus font
      terminus_font
      # nerdfonts: get only a subset
      nerd-fonts.fira-code
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.adwaita-mono
    ];
  };
}
