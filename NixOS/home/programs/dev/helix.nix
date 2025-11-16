{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "base16_default_dark";
      editor = {
        line-number = "relative";
        cursorline = true;
        cursorcolumn = true;
        gutters = [
          "diagnostics"
          "spacer"
          "line-numbers"
          "spacer"
          "diff"
        ];
        auto-completion = true;
        path-completion = true;
        auto-format = true;
        soft-wrap = {
          enable = true;
        };
        clipboard-provider = "wayland";
        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
          ];
          center = [
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "position-percentage"
            "file-encoding"
            "file-line-ending"
          ];
          separator = "|";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        lsp = {
          enable = true;
          display-inlay-hints = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        auto-pairs = true;
      };
      keys = {
        insert = {
          j = {
            k = "normal_mode";
          };
          g = {
            a = "code_action";
          };
          up = "no_op";
          down = "no_op";
          left = "no_op";
          right = "no_op";
          pageup = "no_op";
          pagedown = "no_op";
          home = "no_op";
          end = "no_op";
        };
      };
    };
    languages = {
      language = with pkgs; [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${nixfmt-rfc-style}/bin/nixfmt";
          };
          language-servers = [ "nil" ];
        }
        {
          name = "c";
          auto-format = true;
        }
        {
          name = "cpp";
          auto-format = true;
        }
        {
          name = "python";
          auto-format = true;
          formatter = {
            command = "${python3Packages.black}/bin/black";
            args = [
              "-"
              "-q"
            ];
          };
        }
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "zig";
          auto-format = true;
        }
      ];
    };
  };
}
