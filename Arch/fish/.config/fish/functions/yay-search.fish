function yay-search --wraps=yay\ -Slq\ \|\ fzf\ --preview\ \'yay\ -Si\ \{\}\'\ --layout=reverse --description alias\ yay-search=yay\ -Slq\ \|\ fzf\ --preview\ \'yay\ -Si\ \{\}\'\ --layout=reverse
  yay -Slq | fzf --preview 'yay -Si {}' --layout=reverse $argv
        
end
