function ipv4ext --wraps='curl http://ipecho.net/plain; echo' --description 'alias ipv4ext=curl http://ipecho.net/plain; echo'
  curl http://ipecho.net/plain; echo $argv
        
end
