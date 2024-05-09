function glog --wraps='git log --name-status' --description 'alias glog=git log --name-status'
  git log --name-status $argv
        
end
