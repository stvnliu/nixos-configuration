{...}: {
  plugins = {
    lsp-signature.enable = true;
    lsp-status.enable = true;
    lsp = {
      enable = true;
      servers = {
        # For Python
        pylsp.enable = true;
        #pylyzer.enable = true;
        #ruff.enable = true;
        #ruff_lsp.enable = true;

        # For CXX
        clangd.enable = true;

        # Misc
        bashls.enable = true;
        fsautocomplete.enable = true;
        gopls.enable = true;

        # For Nix
        #nil_ls.enable = true;
        nixd = {
          enable = true;
          extraOptions = {
            home-manager = {
              expr = ''
                (builtins.getFlake "/home/stvnliu/nix-conf/").homeConfigurations."stvnliu@nixos-msi".options'';
            };
          };
        };

        # Haskell
        hls = {
          enable = true;
          installGhc = false;
        };

        # For TypeScript
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

    rustaceanvim = {
      enable = true;
      # rust-tools.enable = true;
    };
  };
  diagnostics.virtual_lines.only_current_line = true;
}
