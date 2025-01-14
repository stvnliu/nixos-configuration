{ pkgs, ... }:

{
  plugins.tagbar = {
    enable = true;
    tagsPackage = pkgs.universal-ctags;
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
