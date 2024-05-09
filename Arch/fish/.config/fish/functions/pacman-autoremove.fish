function pacman-autoremove --wraps='sudo pacman -Rs $(pacman -Qdtq)' --description 'alias pacman-autoremove=sudo pacman -Rs $(pacman -Qdtq)'
  sudo pacman -Rs $(pacman -Qdtq) $argv
        
end
