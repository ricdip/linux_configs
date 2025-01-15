{ consts, ... }:
{
  home.sessionVariables = {
    VISUAL = "hx";
    BROWSER = "firefox";
    PAGER = "bat";
    FLAKE = "/home/${consts.user.name}/${consts.flake}";
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
      lsip = "curl ifconfig.me";
      lsweather = "curl wttr.in"; # (https://github.com/chubin/wttr.in), example: lsweather /Rome
      wifi-password = "nmcli device wifi show-password";
      wifi-list = "nmcli device wifi";
      wifi-off = "nmcli radio wifi off";
      wifi-on = "nmcli radio wifi on";
      wifi-connect = "nmcli device wifi connect";
    };
    functions = {
      fish_greeting = "";
    };
  };
}
