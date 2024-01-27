## MAIN CONFIG ##

# declare all zsh config files

## zshframework
__framework=$HOME/.config/zsh/zshframework
## zshplugins
__plugins=$HOME/.config/zsh/zshplugins
## zshaliases
__aliases=$HOME/.config/zsh/zshaliases
## zshfunctions
__functions=$HOME/.config/zsh/zshfunctions
## zshconda
__conda=$HOME/.config/zsh/zshconda
## zshnnn
__nnn=$HOME/.config/zsh/zshnnn

# main

## import all zsh config files
__files=($__framework $__plugins $__aliases $__functions $__conda $__nnn)

for config_file in ${__files[@]}; do
    if [ -f $config_file ]; then
        source $config_file
    else
        echo "Config file \"$config_file\" not found"
    fi
done

unset config_file
unset __files
unset __framework
unset __plugins
unset __aliases
unset __functions
unset __conda
unset __nnn

## vim mode
bindkey -v

## autocomplete plugin source
source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
