function ssh-agent-start --wraps='eval "$(ssh-agent -s)"' --description 'alias ssh-agent-start=eval "$(ssh-agent -s)"'
  eval "$(ssh-agent -s)" $argv
        
end
