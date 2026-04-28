{ pkgs, inputs, ... }:
{
  # https://github.com/NotAShelf/nvf
  # https://nvf.notashelf.dev/

  # import the nvf home manager module
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        lsp = {
          enable = true;
        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          clang.enable = true;
        };
      };
    };
  };
}
