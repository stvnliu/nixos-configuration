{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        pylsp.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        fsautocomplete.enable = true;
        gopls.enable = true;
        nil_ls.enable = true;
        #nixd.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        ts_ls.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    lsp-lines.enable = true;
    rust-tools.enable = true;
  };
  diagnostics.virtual_lines.only_current_line = true;
}
