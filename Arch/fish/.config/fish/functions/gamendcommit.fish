function gamendcommit --wraps='git commit --amend -m' --description 'alias gamendcommit=git commit --amend -m'
  git commit --amend -m $argv
        
end
