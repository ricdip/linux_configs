typeset -U PATH path
# add paths to the left, paths are separated by spaces
# example: path=("$HOME/miniconda3/bin" "$path[@]")
path=("/home/riccardo/Android/Sdk/platform-tools" "/opt/android-studio/bin" "/var/lib/snapd/snap/bin" "$path[@]")
export PATH

export EDITOR=nvim
