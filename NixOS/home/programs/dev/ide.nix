{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea-oss # Java IDE from jetbrains (built from source)
    # android-studio # official IDE for Android
  ];
}
