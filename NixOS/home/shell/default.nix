{
  imports = [ ./fish.nix ./alacritty.nix ];

  # environment variables
  home.sessionVariables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
  };

  # move scripts
  home.file.".config/fish/functions/n.fish" = {
    source = ./scripts/quitcd.fish;
    executable = true;
  };

  home.file.".config/fish/functions/fish_greeting.fish" = {
    source = ./scripts/fish_greeting.fish;
    executable = true;
  };

  # aliases (for all shells)
  home.shellAliases = {
    # general
    ls = "ls -h --color=auto --group-directories-first";
    ll = "ls -l";
    la = "ls -la";
    diff = "diff --color=auto";
    grep = "grep --color=auto";
    ipv4ext = "curl http://ipecho.net/plain; echo";
    rmi = "rm -i";
    lsnet = "sudo netstat -tulpn";
    rbt = "sudo systemctl reboot";
    off = "sudo systemctl poweroff";
    # git
    glog = "git log --name-status";
    glogchanges = "git log -p";
    gloggraph = "git log --all --decorate --oneline --graph";
    glogsigned = "gloggraph --show-signature";
    gadd = "git add .";
    gcommit = "git commit -m";
    gamendcommit = "git commit --amend -m";
    gnoeditamendcommit = "git commit --amend --no-edit";
    gpushtomaster = "git push -u origin master";
    gpushtomain = "git push -u origin main";
    gstatus = "git status";
    gdiff = "git diff";
    # ssh-agent
    ssh-agent-start = ''eval "$(ssh-agent -s)"'';
    ssh-agent-stop = "pkill ssh-agent";
    # nnn
    nn = "n -d -e";
  };
}
