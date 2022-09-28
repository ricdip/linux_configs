typeset -U PATH path
# add paths to the left, paths are separated by spaces
# example: path=("$HOME/miniconda3/bin" "$path[@]")
# programs path for: Adb, Fastboot, Android, Snap
path=("/home/riccardo/Android/Sdk/platform-tools" "/opt/android-studio/bin" "/var/lib/snapd/snap/bin" "$path[@]")
export PATH

export EDITOR=nvim
# variable for package 'dotnet': disable C# dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
