{ inputs, ... }:
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
        ## basic vim options
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        globals = {
          # use <space> as leader
          mapleader = " ";
        };

        # show relative line numbers
        lineNumberMode = "relNumber";

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

        ## clipboard options
        clipboard = {
          # enable clipboard management for Neovim
          enable = true;
          # enable wl-copy
          providers.wl-copy.enable = true;
          # "", "unnamedplus", "unnamed", "unnamed,unnamedplus"
          # - "unnamed": use the clipboard register "*" for all yank, delete, change and put operations which would normally go to the unnamed register.
          # - "unnamedplus": variant of the "unnamed" flag which uses the clipboard register "+" instead of register "*" for all yank, delete, change and put operations which would normally go to the unnamed register.
          # - "unnamed,unnamedplus": yank and delete operations (but not put) will additionally copy the text into register "*"
          registers = "unnamedplus";
        };

        ## custom key bindings
        keymaps = [
          ## maps
          # map 'jk' to exit insert mode and go to normal mode
          {
            key = "jk";
            mode = "i";
            action = "<Esc>";
          }
          ## splits
          # horizontal split
          {
            key = "<leader>h";
            mode = "n";
            action = "<C-w>s";
          }
          # vertical split
          {
            key = "<leader>v";
            mode = "n";
            action = "<C-w>v";
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
          # quit the file without saving
          {
            key = "<leader>Q";
            mode = "n";
            action = ":q!<CR>";
          }
          ## navigation between tabs
          # open a new tab
          {
            key = "tt";
            mode = "n";
            action = ":tabnew<CR>";
          }
          # go to the previous tab
          {
            key = "tp";
            mode = "n";
            action = ":tabprevious<CR>";
          }
          # go to the next tab
          {
            key = "tn";
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
          # clear search highlight
          {
            key = "<leader>c";
            mode = "n";
            action = ":noh<CR>";
          }
          ## plugins
          # toggle trouble diagnostics
          {
            key = "<leader>d";
            mode = "n";
            action = ":Trouble diagnostics toggle<CR>";
          }
          # toggle hardtime helper
          {
            key = "<leader>z";
            mode = "n";
            action = ":Hardtime toggle<CR>";
          }
        ];

        ## plugins

        statusline.lualine = {
          # enable lualine statusline plugin
          enable = true;
          # | A | B | C X | Y | Z |
          # using defaults for statusline
          /*
            activeSection = {
              # | (A) | B | C X | Y | Z |
              a = [];
              # | A | (B) | C X | Y | Z |
              b = [];
              # | A | B | (C) X | Y | Z |
              c = [];
              # | A | B | C (X) | Y | Z |
              x = [];
              # | A | B | C X | (Y) | Z |
              y = [];
              # | A | B | C X | Y | (Z) |
              z = [];
            };
          */
        };

        # enable telescope.nvim: multi-purpose search and picker utility
        telescope.enable = true;

        # enable autopairs
        autopairs.nvim-autopairs.enable = true;

        autocomplete.nvim-cmp = {
          # enable nvim-cmp
          enable = true;
        };

        # enable comment plugin for neovim [comment-nvim]
        # comments.comment-nvim.enable = true;

        binds = {
          whichKey = {
            # enable which-key keybind helper menu
            enable = true;
            # "classic", "modern", "helix"
            setupOpts.preset = "helix";
          };
          # enable cheatsheet-nvim: searchable cheatsheet for nvim using telescope
          cheatsheet.enable = true;
          # enable hardtime helper for no repeat keybinds
          hardtime-nvim.enable = true;
        };

        # enable filetree via nvim-tree.lua
        filetree.nvimTree.enable = true;

        # enable cursor word and line highlighting [nvim-cursorline]
        visuals.nvim-cursorline = {
          enable = true;
          setupOpts = {
            cursorline = {
              enable = true;
              timeout = 1000;
              number = false;
            };
            cursorword = {
              enable = true;
              min_length = 3;
              hl.underline = true;
            };
          };
        };

        ## programming

        lsp = {
          # enable global LSP functionality for Neovim
          enable = true;
          # enable trouble diagnostics viewer
          trouble.enable = true;
        };

        # language support
        languages = {
          # enable Treesitter for enabled languages
          enableTreesitter = true;
          # enable languages
          nix.enable = true;
          bash.enable = true;
          just.enable = true;
          markdown.enable = true;
          yaml.enable = true;
          json.enable = true;
          toml.enable = true;
          xml.enable = true;
          clang.enable = true;
          assembly.enable = true;
          rust.enable = true;
          zig.enable = true;
          java.enable = true;
          python.enable = true;
          go.enable = true;
          sql.enable = true;
          html.enable = true;
          css.enable = true;
          typescript.enable = true;
        };
      };
    };
  };
}
