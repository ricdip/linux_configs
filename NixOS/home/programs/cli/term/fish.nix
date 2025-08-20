{ consts, ... }:
{
  home.sessionVariables = {
    VISUAL = "hx";
    BROWSER = "firefox";
    PAGER = "bat";
    NH_FLAKE = "/home/${consts.user.name}/${consts.flake}";
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      df = "df -h";
      free = "free -h";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      ls = "lsd -hAN --group-directories-first --color=always";
      grep = "grep --color=always";
      diff = "diff --color=always";
      # lsnet-listen = "sudo netstat -tulpn";
      lsnet-listen = "sudo ss -tulpn";
      lsnet-established = "sudo ss -antp state established";
      lsip = "curl ifconfig.me"; # print external IP address
      wifi-password = "nmcli device wifi show-password";
      wifi-list = "nmcli device wifi";
      wifi-off = "nmcli radio wifi off";
      wifi-on = "nmcli radio wifi on";
      wifi-connect = "nmcli --ask device wifi connect";
      gpg-encrypt = "gpg -c --no-symkey-cache --cipher-algo AES256";
      gpg-decrypt = "gpg -d --no-symkey-cache";
      ps-cpu = "ps aux --sort=-pcpu | head -n 15";
      ps-mem = "ps aux --sort=-pmem | head -n 15";
      ls-mount = "mount | column -t";
      c = "clear";
    };
    functions = {
      # disable fish greeting message
      fish_greeting = "";
      # check weather from terminal: https://github.com/chubin/wttr.in
      lsweather = ''
        if test (count $argv) -eq 1
          curl wttr.in/"$argv[1]"
        else
          echo "Error: expected 1 argument"
          return 1
        end
      '';
    };
  };
}
