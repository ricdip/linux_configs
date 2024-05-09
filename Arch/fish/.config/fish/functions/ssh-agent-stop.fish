function ssh-agent-stop --wraps='pkill ssh-agent' --description 'alias ssh-agent-stop=pkill ssh-agent'
  pkill ssh-agent $argv
        
end
