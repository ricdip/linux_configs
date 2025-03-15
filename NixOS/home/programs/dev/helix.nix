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
        gutters = [
          "diagnostics"
          "spacer"
          "line-numbers"
          "spacer"
          "diff"
        ];
        auto-completion = true;
        auto-format = true;
        soft-wrap = {
          enable = true;
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
          language-servers = [ "nixd" ];
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
      ];
    };
  };
}
