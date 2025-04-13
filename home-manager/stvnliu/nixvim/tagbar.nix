{ pkgs, ... }:

{

  dependencies.ctags.package = pkgs.universal-ctags;
  plugins.tagbar = {
    enable = true;
    settings = {
      autoclose = false;
      autofocus = false;
      autoshowtag = true;
      foldlevel = 2;
      iconchars = [ "" "" ];
      position = "right";
      visibility_symbols = {
        private = "󰛑 ";
        protected = "󱗤 ";
        public = "󰡭 ";
      };
    };
  };
}
