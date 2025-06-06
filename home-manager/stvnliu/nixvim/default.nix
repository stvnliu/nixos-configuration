{ ... }: {
  imports = [
    ./auto-pairs.nix
    ./autosave.nix
    #./bufferline.nix
    ./cmp.nix
    #./coq.nix
    ./git.nix
    #./ionide.nix
    ./lualine.nix
    ./lsp.nix
    ./none-ls.nix
    ./nvim-tree.nix
    ./options.nix
    ./telescope.nix
    ./toggleterm.nix
    ./transparent.nix
    ./treesitter.nix
    ./trouble.nix
    ./which_key.nix
    ./wilder.nix
    ./virt-column.nix
    ./devicons.nix
    ./tagbar.nix
    ./wrapping.nix
    ./twilight.nix
  ];
  enable = true;
  enableMan = true;
  defaultEditor = true;
  globals.mapleader = " ";
  colorschemes.gruvbox = { enable = true; };
  performance = {
    byteCompileLua.enable = true;
    combinePlugins = {
      enable = true;
      /*standalonePlugins = [
        "nvim-treesitter"
      ];*/
    };
  };
  keymaps =
    [
      # Global
      # Default mode is "" which means normal-visual-op
      {
        mode = "n";
        key = "<leader>bg";
        action = "<CMD>TransparentToggle<CR>";
        options.desc = "Toggle background transparency";
      }
      {
        key = "<C-n>";
        action = "<CMD>NvimTreeToggle<CR>";
        options.desc = "Toggle NvimTree";
      }

      # File
      {
        mode = "n";
        key = "<leader>f";
        action = "+find/file";
      }
      {
        # Format file
        key = "<leader>fm";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
        options.desc = "Format the current buffer";
      }

      # Git
      {
        mode = "n";
        key = "<leader>g";
        action = "+git";
      }
      {
        mode = "n";
        key = "<leader>gt";
        action = "+toggles";
      }
      {
        key = "<leader>gtb";
        action = "<CMD>Gitsigns toggle_current_line_blame<CR>";
        options.desc = "Gitsigns current line blame";
      }
      {
        key = "<leader>gtd";
        action = "<CMD>Gitsigns toggle_deleted";
        options.desc = "Gitsigns deleted";
      }
      {
        key = "<leader>gd";
        action = "<CMD>Gitsigns diffthis<CR>";
        options.desc = "Gitsigns diff this buffer";
      }

      # Tabs
      {
        mode = "n";
        key = "<leader>t";
        action = "+tab";
      }
      {
        mode = "n";
        key = "<leader>tn";
        action = "<CMD>tabnew<CR>";
        options.desc = "Create new tab";
      }
      {
        mode = "n";
        key = "<leader>td";
        action = "<CMD>tabclose<CR>";
        options.desc = "Close tab";
      }
      {
        mode = "n";
        key = "<leader>ts";
        action = "<CMD>tabnext<CR>";
        options.desc = "Go to the sub-sequent tab";
      }
      {
        mode = "n";
        key = "<leader>tp";
        action = "<CMD>tabprevious<CR>";
        options.desc = "Go to the previous tab";
      }

      # Terminal
      {
        # Escape terminal mode using ESC
        mode = "t";
        key = "<esc>";
        action = "<C-\\><C-n>";
        options.desc = "Escape terminal mode";
      }

      # Trouble
      {
        mode = "n";
        key = "<leader>d";
        action = "+diagnostics/debug";
      }
      {
        key = "<leader>dt";
        action = "<CMD>TroubleToggle<CR>";
        options.desc = "Toggle trouble";
      }

      # Rust
      {
        mode = "n";
        key = "<leader>r";
        action = "+rust";
      }
      {
        # Start standalone rust-analyzer (fixes issues when opening files from nvim tree)
        mode = "n";
        key = "<leader>rs";
        action = "<CMD>RustStartStandaloneServerForBuffer<CR>";
        options.desc = "Start standalone rust-analyzer";
      }
    ]
    ++ (import ./custom/binds.nix);
}
