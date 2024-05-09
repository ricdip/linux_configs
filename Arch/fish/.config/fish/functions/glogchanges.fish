function glogchanges --wraps='git log -p' --description 'alias glogchanges=git log -p'
  git log -p $argv
        
end
