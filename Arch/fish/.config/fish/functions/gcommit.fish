function gcommit --wraps='git commit -m' --description 'alias gcommit=git commit -m'
  git commit -m $argv
        
end
