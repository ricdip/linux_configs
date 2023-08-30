typeset -U PATH path
# add paths to the left, paths are separated by spaces
# example: path=("$HOME/miniconda3/bin" "$path[@]")
# programs path for: Android
path=("$HOME/.local/bin" "$HOME/Android/Sdk/platform-tools" "$path[@]")
export PATH

# editor var
export EDITOR=nvim

# java home
export JAVA_HOME=/usr/lib/jvm/java-20-openjdk/

# vars for git: signed commits with GPG
export GPG_TTY=$(tty)

# vars for nnn:
# file manager colors setting
export NNN_COLORS='6666'
export NNN_PLUG="p:preview-tui"
export NNN_TERMINAL="alacritty"
export NNN_PREVIEWDIR=/tmp/nnn/previews

# man var
export MANPATH="/usr/local/man:$MANPATH"

# compilation flags
export ARCHFLAGS="-arch x86_64"
