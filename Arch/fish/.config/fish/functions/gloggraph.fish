function gloggraph --wraps='git log --all --decorate --oneline --graph' --description 'alias gloggraph=git log --all --decorate --oneline --graph'
  git log --all --decorate --oneline --graph $argv
        
end
