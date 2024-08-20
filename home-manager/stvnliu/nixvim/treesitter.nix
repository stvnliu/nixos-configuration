{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true; # enables language injection in nixvim
      indent = true;
    };
    treesitter-context.enable = true;
    rainbow-delimiters.enable = true;
  };
}
