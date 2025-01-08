{ pkgs, ... }: {
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true; # enables language injection in nixvim
      settings.indent.enable = true;
      grammarPackages =
        pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars
        ++ [
          pkgs.tree-sitter-grammars.tree-sitter-nu
        ];
    };
    treesitter-context.enable = true;
    rainbow-delimiters.enable = true;
  };
}
