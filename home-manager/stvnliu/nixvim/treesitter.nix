{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true; # enables language injection in nixvim
      settings.indent.enable = true;
    };
    treesitter-context.enable = true;
    rainbow-delimiters.enable = true;
  };
}
