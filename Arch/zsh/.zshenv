typeset -U PATH path
# add paths to the left, paths are separated by spaces
# example: path=("$HOME/miniconda3/bin" "$path[@]")
# programs path for: Adb, Fastboot, Android Studio, Android Sdk, Flutter
path=("/home/riccardo/Android/Sdk/platform-tools" "/opt/android-studio/bin" "$HOME/Android/Sdk" "/opt/flutter/bin" "$path[@]")
export PATH
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

export EDITOR=nvim
# variable for package 'dotnet': disable C# dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
