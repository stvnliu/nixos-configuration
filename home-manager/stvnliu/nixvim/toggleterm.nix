{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<C-t>]]";
      # FIXME this is weird because the shell option must be manually updated
      # because I don't understand how .nix files work when imported
      shell = "fish";
    };
  };
}
