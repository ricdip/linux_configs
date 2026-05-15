{ consts, lib, ... }:
{
  home.sessionVariables = {
    NH_FLAKE = "/home/${consts.user.name}/${consts.flake}";
    VISUAL = "nvim";
    EDITOR = "nvim";
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
      intel-watch = "sudo intel_gpu_top";
      nvidia-watch = "nvidia-smi -l 1";
      nvidia-ps = "sudo fuser -v /dev/nvidia*";
      nvidia-run = "nvidia-offload";
      ## files
      ls = "eza_auto -hA --group-directories-first";
      ll = "eza_auto -lh --group-directories-first";
      la = "eza_auto -lha --group-directories-first";
      lt = "eza_auto --tree --level=2";
      cat = "bat --style=plain";
      less = "less -R";
      diff = "diff --color=auto";
      e = "$EDITOR";
      glow = "glow --pager";
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
      gpg-import = "gpg --import";
      gpg-encrypt = "gpg -c --no-symkey-cache --cipher-algo AES256";
      gpg-decrypt = "gpg -d --no-symkey-cache";
      ## quality of life
      c = "clear";
      h = "history";
      j = "just";
      clock = "watch -n 1 date";
      ":q" = "exit";
      sudo-xrun = "sudo -E";
      xrun = "env DISPLAY=$DISPLAY";
      cdi = "zi"; # fuzzy interactive jump
      poweroff-device = "sudo udisksctl power-off -b";
      noctalia-dump-config = "noctalia-shell ipc call state all > ./noctalia-settings.json";
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
      ## btrfs
      # subvolumes
      btrfs-subvolume-list = "sudo btrfs subvolume list";
      btrfs-subvolume-create = "sudo btrfs subvolume create";
      btrfs-subvolume-delete = "sudo btrfs subvolume delete";
      # snapshots
      btrfs-snapshot-w = "sudo btrfs subvolume snapshot";
      btrfs-snapshot-ro = "sudo btrfs subvolume snapshot -r";
      # balance (only light scrub (dusage=75) every 3 months: do it if a lot of data or snapshots are deleted)
      btrfs-balance-start = "sudo btrfs balance start -dusage=75";
      btrfs-balance-status = "sudo btrfs balance status";
      # scrub (every month)
      btrfs-scrub-start = "sudo btrfs scrub start -Bd";
      btrfs-scrub-status = "sudo btrfs scrub status";
      # device (physical disks info)
      btrfs-device-usage = "sudo btrfs device usage"; # shows allocated space, chunk data/metadata/system, free space
      btrfs-device-stats = "sudo btrfs device stats"; # shows hardware and checksum errors
      # filesystem (logical disks info)
      btrfs-filesystem-usage = "sudo btrfs filesystem usage"; # shows complete filesystem info
      btrfs-filesystem-show = "sudo btrfs filesystem show"; # shows detected btrfs filesystems and associated devices
      btrfs-filesystem-du = "sudo btrfs filesystem du -s"; # shows real space used by file/subvolume/snapshot
      # quota (limit the space used by a subvolume)
      btrfs-quota-show = "sudo btrfs qgroup show";
      ## snapper
      snapper-configs-list = "sudo snapper list-configs";
      # snapshots
      snapper-home-snapshots-list = "sudo snapper -c home list";
      snapper-home-status = "sudo snapper -c home status";
      snapper-home-diff = "sudo snapper -c home diff";
      snapper-home-recover = "sudo snapper -c home undochange";
      snapper-home-delete = "sudo snapper -c home delete";
      # cleanup
      snapper-home-cleanup-timeline = "sudo snapper -c home cleanup timeline";
      snapper-home-cleanup-number = "sudo snapper -c home cleanup number";
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
        nix eval --raw "nixpkgs#$argv[1]"
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
      # enable ssh agent
      ssh-agent-enable = ''
        eval (ssh-agent -c)
      '';
      # enable personal GitHub
      git-personal-ssh-enable = ''
        ssh-agent-enable && ssh-add $HOME/.ssh/github_personal
      '';
      # use zoxide as cd
      cd = ''
        z $argv
      '';
      # use icons in eza when not in console
      eza_auto = ''
        if test "$TERM" = "linux"
          eza $argv
        else
          eza --icons=auto $argv
        end
      '';
    };
    interactiveShellInit = ''
      zoxide init fish | source
      set -g fish_color_command blue
      set -g fish_color_error red
      set -g fish_color_param white
      set -g fish_color_valid_path green
    '';
  };
}
