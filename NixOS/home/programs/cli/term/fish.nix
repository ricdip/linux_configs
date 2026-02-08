{ consts, lib, ... }:
{
  home.sessionVariables = {
    NH_FLAKE = "/home/${consts.user.name}/${consts.flake}";
    VISUAL = "hx";
    BROWSER = "firefox";
    PAGER = "bat";
    LESS = "-R --ignore-case --quit-if-one-screen";
    MANPAGER = "less -R --use-color";
    FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --exclude .git";
    BAT_THEME = "base16";
    HISTSIZE = 50000;
    HISTFILESIZE = 100000;
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ## system
      df = "df -h";
      du = "du -h";
      free = "free -m";
      top = "htop";
      md = "mkdir -p";
      rd = "rmdir";
      ps-cpu = "ps aux --sort=-pcpu | head -n 15";
      ps-mem = "ps aux --sort=-pmem | head -n 15";
      ls-mount = "mount | column -t";
      ## graphics
      # gtop = "nvtop";
      intel-watch = "sudo intel_gpu_top";
      nvidia-watch = "nvidia-smi -l 1";
      nvidia-ps = "sudo fuser -v /dev/nvidia*";
      nvidia-run = "nvidia-offload";
      ## files
      ls = "lsd -hAN --group-directories-first --color=auto";
      ll = "lsd -lh --group-directories-first --color=auto";
      la = "lsd -lha --group-directories-first --color=auto";
      lt = "lsd --tree";
      cat = "bat --style=plain";
      less = "less -R";
      diff = "diff --color=auto";
      e = "$EDITOR";
      ## safety
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      ## search
      grep = "grep --color=auto";
      f = "fzf";
      rg = "rg --hidden --glob '!.git/*'";
      ## networking
      # lsnet-listen = "sudo netstat -tulpn";
      lsnet-listen = "sudo ss -tulpn";
      lsnet-established = "sudo ss -antp state established";
      lsip = "curl ifconfig.me"; # print external IP address
      wifi-password = "nmcli device wifi show-password";
      wifi-list = "nmcli device wifi";
      wifi-off = "nmcli radio wifi off";
      wifi-on = "nmcli radio wifi on";
      wifi-connect = "nmcli --ask device wifi connect";
      wifi-tui = "sudo nmtui";
      ## gpg
      gpg-ls-pub = "gpg --list-keys";
      gpg-ls-sec = "gpg --list-secret-keys --keyid-format=long";
      gpg-encrypt = "gpg -c --no-symkey-cache --cipher-algo AES256";
      gpg-decrypt = "gpg -d --no-symkey-cache";
      ## quality of life
      c = "clear";
      h = "history";
      clock = "watch -n 1 date";
      ":q" = "exit";
      cliphist-wipe = "cliphist wipe";
      xrun = "env -u WAYLAND_DISPLAY"; # run application with xwayland
      sway-disable-screen-poweroff = ''
        swaymsg "inhibit_idle open"
      '';
      sway-enable-screen-poweroff = ''
        swaymsg "inhibit_idle none"
      '';
      ## git
      gs = "git status -sb";
      gsf = "git status";
      ga = "git add";
      gc = "git commit -m";
      gca = "git commit --amend";
      gps = "git push";
      gpl = "git pull";
      gd = "git diff";
      gw = "git switch";
      gl = "git log";
      glo = "git log --oneline --decorate";
      glg = "git log --graph --oneline --decorate";
      gls = "git log --stat";
      gld = "git log -p";
    };
    functions = {
      # disable fish greeting message
      fish_greeting = "";
      # check weather from terminal: https://github.com/chubin/wttr.in
      ls-weather = ''
        if test (count $argv) -eq 1
          curl wttr.in/"$argv[1]"
        else
          echo "Error: expected 1 argument"
          return 1
        end
      '';
      # rerun last command with sudo
      please = ''
        set cmd $history[1]
        echo "sudo $cmd"
        eval sudo $cmd
      '';
      # grep from history
      histgrep = ''
        history | grep $argv
      '';
      # locate nix packages
      locate = ''
        nix eval --raw nixpkgs#"$argv[1]"
      '';
      # set defaults DNS to wlp3s0 interface
      dns-set-defaults = ''
        set dns ${lib.strings.concatStringsSep " " consts.networking.nameserver.defaults}
        echo Setting "$dns" as wlp3s0 DNS
        sudo resolvectl dns wlp3s0 $dns
      '';
      # set fallbacks DNS to wlp3s0 interface
      dns-set-fallbacks = ''
        set dns ${lib.strings.concatStringsSep " " consts.networking.nameserver.fallback}
        echo Setting "$dns" as wlp3s0 DNS
        sudo resolvectl dns wlp3s0 $dns
      '';
    };
  };
}
