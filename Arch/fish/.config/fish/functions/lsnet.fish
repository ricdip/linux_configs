function lsnet --wraps='sudo netstat -tulpn' --description 'alias lsnet=sudo netstat -tulpn'
  sudo netstat -tulpn $argv
        
end
