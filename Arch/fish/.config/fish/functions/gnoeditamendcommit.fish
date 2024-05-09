function gnoeditamendcommit --wraps='git commit --amend --no-edit' --description 'alias gnoeditamendcommit=git commit --amend --no-edit'
  git commit --amend --no-edit $argv
        
end
