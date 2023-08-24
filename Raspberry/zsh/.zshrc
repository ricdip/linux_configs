# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git jump fd fzf)
plugins=(git jump fd fzf)

# FZF plugin settings
DISABLE_FZF_AUTO_COMPLETION="false"

source $ZSH/oh-my-zsh.sh

# User configuration

## You may need to manually set your language environment
export LANG=it_IT.UTF-8

## Preferred editor
export EDITOR='nvim'

## vars for git: signed commits with GPG
export GPG_TTY=$(tty)

## vars for nnn:
export NNN_COLORS='6666'
export NNN_PLUG="p:preview-tui"
export NNN_TERMINAL="xterm-256color"
export NNN_PREVIEWDIR=/tmp/nnn/previews

## man var
export MANPATH="/usr/local/man:$MANPATH"

## compilation flags
export ARCHFLAGS="-arch aarch64"

## aliases
alias fd="fdfind"
alias bat="batcat"

alias ls='ls -h --color=auto --group-directories-first'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ipv4ext="curl http://ipecho.net/plain; echo"
alias n='nvim'
alias rm='rm -i'
alias nn='nnn -d -e -a'
alias lsnet='sudo netstat -tulpn'

### git
alias glog='git log --name-status'
alias glogchanges='git log -p'
alias gloggraph='git log --all --decorate --oneline --graph'
alias glogsigned='gloggraph --show-signature'
alias gadd='git add .'
alias gcommit='git commit -m'
alias gamendcommit='git commit --amend -m'
alias gnoeditamendcommit='git commit --amend --no-edit'
alias gpushtomaster='git push -u origin master'
alias gpushtomain='git push -u origin main'
alias gstatus='git status'
alias gdiff='git diff'

### systemd
alias rbt='sudo systemctl reboot'
alias off='sudo systemctl poweroff'
alias susp='sudo systemctl suspend'
alias hbt='sudo systemctl hibernate'

### ssh-agent
alias ssh-agent-start='eval "$(ssh-agent -s)"'
alias ssh-agent-stop='pkill ssh-agent'

