typeset -U PATH path
# add paths to the left, paths are separated by spaces
# example: path=("$HOME/miniconda3/bin" "$path[@]")
# programs path for: Adb, Fastboot, Android Studio, Android Sdk, Flutter
path=("$HOME/.local/bin" "$HOME/Android/Sdk/platform-tools" "/opt/android-studio/bin" "$HOME/Android/Sdk" "/opt/flutter/bin" "$path[@]")
export PATH

# editor var
export EDITOR=nvim

# vars for package flutter
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
# vars for package dotnet: disable C# dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
# vars for git: signed commits with GPG
export GPG_TTY=$(tty)
# vars for nnn: file manager colors setting
export NNN_COLORS='6666'

# man var
export MANPATH="/usr/local/man:$MANPATH"
# compilation flags
export ARCHFLAGS="-arch x86_64"
