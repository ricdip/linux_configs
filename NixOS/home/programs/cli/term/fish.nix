{
  home.sessionVariables = {
    VISUAL = "hx";
    BROWSER = "firefox";
    PAGER = "bat";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      df = "df -h";
      free = "free -h";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      ls = "ls -hAN --group-directories-first --color=always";
      grep = "grep --color=always";
      diff = "diff --color=always";
      lsnet = "sudo netstat -tulpn";
    };
    functions = {
      fish_greeting = "";
    };
  };
}
