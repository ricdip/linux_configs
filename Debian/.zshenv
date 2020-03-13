typeset -U PATH path
path=("$HOME/.config/composer/vendor/bin" "/usr/local/android-studio/bin" "/usr/local/apache-maven-3.6.3/bin" "$HOME/bin" "$path[@]")
export PATH

export EDITOR=vim

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
