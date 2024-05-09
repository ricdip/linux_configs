function gpushtomaster --wraps='git push -u origin master' --description 'alias gpushtomaster=git push -u origin master'
  git push -u origin master $argv
        
end
