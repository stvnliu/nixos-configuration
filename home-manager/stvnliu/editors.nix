{ pkgs, ... }: {
  programs.nixvim = import ./nixvim;
  # dependencies for nixvim configuration
  home.packages = with pkgs; [ ripgrep fd ];
  programs.helix = {
    enable = true;
    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = import ./helix-langs.nix { inherit pkgs; };
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };
}
