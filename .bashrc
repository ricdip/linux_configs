## bashrc file

## alias

alias ls='ls -h --color=auto'
alias ll='ls -la'
alias restart='systemctl reboot'
alias off='systemctl poweroff'
alias ..='cd ..'

# git alias

alias gstatus='git status'
alias gadd='git add .'
alias gcommit='git commit'
alias gpushmaster='git push origin master'
alias gpull='git pull'


## vars

export EDITOR=vim

export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\]\[\033[38;5;6m\]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"


########################################

echo
echo - User $(whoami) on host $(hostname) -
echo


function getip(){
    local INTERFACE="$1"

    if [ -z "$INTERFACE" ]; then
        INTERFACE="ens33";
    fi

    local IP="$(ip addr show $INTERFACE | awk '{if($1 == "inet"){ print $2 } }')"
    echo $IP
}


function getmac(){
    local INTERFACE="$1"

    if [ -z "$INTERFACE" ]; then
        INTERFACE="ens33"
    fi

    local MAC="$(ip link show $INTERFACE | awk '{if($1 == "link/ether"){ print $2 } }')"
    echo $MAC
}


function meminfo(){
    cat /proc/meminfo | less
}


function cpuinfo(){
    cat /proc/cpuinfo | less
}

