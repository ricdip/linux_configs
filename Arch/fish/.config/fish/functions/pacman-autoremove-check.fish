function pacman-autoremove-check --wraps='pacman -Qdt' --description 'alias pacman-autoremove-check=pacman -Qdt'
  pacman -Qdt $argv
        
end
