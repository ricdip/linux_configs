function pacman-search --wraps=pacman\ -Slq\ \|\ fzf\ --preview\ \'pacman\ -Si\ \{\}\'\ --layout=reverse --description alias\ pacman-search=pacman\ -Slq\ \|\ fzf\ --preview\ \'pacman\ -Si\ \{\}\'\ --layout=reverse
  pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse $argv
        
end
