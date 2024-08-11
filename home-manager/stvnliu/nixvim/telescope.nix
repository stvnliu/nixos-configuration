{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<C-p>" = "live_grep";
      "<leader>fg" = {
        action = "git_files";
        options = {
          desc = "Telescope Git Files";
        };
      };
    };
    extensions.fzf-native = {enable = true;};
  };
}
