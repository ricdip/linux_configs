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
      noto-fonts-monochrome-emoji
      noto-fonts-color-emoji
      # hack font
      #hack-font
      # terminus font
      terminus_font
      # nerdfonts: get only a subset
      nerd-fonts.fira-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.adwaita-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.hack
      nerd-fonts.symbols-only
      nerd-fonts.noto
    ];
  };
}
