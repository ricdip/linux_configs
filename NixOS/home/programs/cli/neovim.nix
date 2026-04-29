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

        # show relative line numbers
        lineNumberMode = "relNumber";

        globals = {
          # use <space> as leader
          mapleader = " ";
        };

        options = {
          ## tab management
          # set indentation width
          shiftwidth = 4;
          # set tab width to 4 spaces
          tabstop = 4;
          ## navigation
          # highlight the current line
          cursorlineopt = "line";
          # enable word wrapping
          wrap = true;
        };

        # custom key bindings
        keymaps = [
          ## maps
          # map 'jk' to exit insert mode and go to normal mode
          {
            key = "jk";
            mode = "i";
            action = "<Esc>";
          }
          ## navigation between windows (split)
          # move left
          {
            key = "<C-h>";
            mode = "n";
            action = "<C-w>h";
          }
          # move down
          {
            key = "<C-j>";
            mode = "n";
            action = "<C-w>j";
          }
          # move up
          {
            key = "<C-k>";
            mode = "n";
            action = "<C-w>k";
          }
          # move right
          {
            key = "<C-l>";
            mode = "n";
            action = "<C-w>l";
          }
          ## quick save and quit
          # save the file
          {
            key = "<leader>w";
            mode = "n";
            action = ":w<CR>";
          }
          # quit the file
          {
            key = "<leader>q";
            mode = "n";
            action = ":q<CR>";
          }
          # save and quit the file
          {
            key = "<leader>x";
            mode = "n";
            action = ":x<CR>";
          }
          ## navigation between tabs
          # open a new tab
          {
            key = "<leader>tn";
            mode = "n";
            action = ":tabnew<CR>";
          }
          # go to the previous tab
          {
            key = "<leader>tp";
            mode = "n";
            action = ":tabprevious<CR>";
          }
          # go to the next tab
          {
            key = "<leader>tt";
            mode = "n";
            action = ":tabnext<CR>";
          }
          ## navigate between open buffers
          # go to the next buffer
          {
            key = "<leader>b";
            mode = "n";
            action = ":bnext<CR>";
          }
          # go to the previous buffer
          {
            key = "<leader>B";
            mode = "n";
            action = ":bprevious<CR>";
          }
        ];

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          clang.enable = true;
        };
      };
    };
  };
}
