{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-community-bin # Java IDE from jetbrains
    android-studio # official IDE for Android
  ];
}
